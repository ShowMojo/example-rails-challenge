# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:customer) { create(:customer) }
  let(:charge) { create(:charge, paid: false, refunded: false, customer: customer) }

  it 'has a valid factory' do
    expect(build(:charge, paid: false, refunded: false, customer: customer)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { is_expected.to belong_to(:customer) }
  end

  describe '.failed' do
    it 'returns failed credit card charges' do
      failed_charge = create(:charge, paid: false, refunded: false, customer: customer)
      expect(failed_charge.customer).to eq customer
      expect(failed_charge.paid).to be(false)
      expect(failed_charge.refunded).to be(false)
    end
  end

  describe '.disputed' do
    it 'returns disputed credit card charges' do
      disputed_charge = create(:charge, paid: true, refunded: true, customer: customer)
      expect(disputed_charge.customer).to eq customer
      expect(disputed_charge.paid).to be(true)
      expect(disputed_charge.refunded).to be(true)
    end
  end

  describe '.successful' do
    it 'returns successful credit card charges' do
      successful_charge = create(:charge, paid: true, refunded: false, customer: customer)
      expect(successful_charge.customer).to eq customer
      expect(successful_charge.paid).to be(true)
      expect(successful_charge.refunded).to be(false)
    end
  end
end
