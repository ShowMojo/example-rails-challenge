# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  describe 'associations' do
    it { expect(FactoryBot.create(:credit_card_charge, :successful)).to respond_to(:customer) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(FactoryBot.build(:credit_card_charge, :successful)).to be_valid
    end

    it 'is not valid without attributes' do
      expect(CreditCardCharge.new).to be_invalid
    end

    it 'is not valid without customer' do
      expect(CreditCardCharge.new(amount: 2500, currency: CreditCardCharge::DEFAULT_CURRENCY, paid: true, refunded: false)).to be_invalid
    end

    ['amount', 'currency', 'paid', 'refunded'].each do |attribute|
      it "is not valid without an #{attribute}" do
        credit_card_charge = FactoryBot.build(:credit_card_charge, :successful)
        credit_card_charge[attribute] = nil
        expect(credit_card_charge).to be_invalid
      end
    end
  end

  describe 'methods' do
    it '#format_amount returns pretty formatted amount' do
      credit_card_charge = FactoryBot.build(:credit_card_charge, :successful)
      expect(credit_card_charge.format_amount).to eq('35.00 USD')
    end

    it '#successful returns only successful charges' do
      FactoryBot.create(:credit_card_charge, :failed)
      FactoryBot.create(:credit_card_charge, :disputed)
      success = FactoryBot.create(:credit_card_charge, :successful)
      expect(CreditCardCharge.successful).to eq([success])
    end

    it '#failed returns only failed charges' do
      fail = FactoryBot.create(:credit_card_charge, :failed)
      FactoryBot.create(:credit_card_charge, :disputed)
      FactoryBot.create(:credit_card_charge, :successful)
      expect(CreditCardCharge.failed).to eq([fail])
    end

    it '#disputed returns only disputed charges' do
      FactoryBot.create(:credit_card_charge, :failed)
      FactoryBot.create(:credit_card_charge, :successful)
      disputed = FactoryBot.create(:credit_card_charge, :disputed)
      expect(CreditCardCharge.disputed).to eq([disputed])
    end
  end
end
