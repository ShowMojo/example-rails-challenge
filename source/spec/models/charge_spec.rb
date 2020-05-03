# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:customer) { FactoryBot.create :customer }
  let(:charge_hash) { { currency: Charge.currencies['usd'], amount: rand(100..300) } }

  describe 'Validations' do
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:amount) }
    it { should define_enum_for(:currency).with(%i[usd inr eur gbp]) }
  end

  describe 'Successful credit card charges scope' do
    it 'Create successful charge that should be included in .successful' do
      successful_hash = { paid: true, refunded: false }
      successed_charge = customer.charges.create!(charge_hash.merge(successful_hash))
      expect(Charge.successful).to include(successed_charge)
    end
  end

  describe 'Failed credit card charges scope' do
    it 'Create failed charge that should be included in .failed' do
      failed_hash = { paid: false, refunded: false }
      failed_charge = customer.charges.create!(charge_hash.merge(failed_hash))
      expect(Charge.failed).to include(failed_charge)
    end
  end

  describe 'Disputed credit card charges scope' do
    it 'Create disputed charge that should be included in .disputed' do
      disputed_hash = { paid: true, refunded: true }
      disputed_charge = customer.charges.create!(charge_hash.merge(disputed_hash))
      expect(Charge.disputed).to include(disputed_charge)
    end
  end
end
