require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  fixtures :credit_card_charges, :customers

  context 'scopes' do
    let(:paid) { CreditCardCharge.paid }
    let(:failed) { CreditCardCharge.failed }
    let(:disputed) { CreditCardCharge.disputed }

    it 'returns paid credit card charges' do
      expect(paid.count).to eq 10
    end

    it 'returns failed credit card charges' do
      expect(failed.count).to eq 5
    end

    it 'returns disputed credit card charges' do
      expect(disputed.count).to eq 5
    end
  end

  context 'customer' do
    it 'returns the name' do
      credit_card_charge = CreditCardCharge.last
      customer = credit_card_charge.customer

      expect(credit_card_charge.name).to eq customer.name
    end
  end
end
