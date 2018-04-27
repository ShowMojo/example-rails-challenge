require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers, :credit_card_charges

  context 'columns' do
    let(:customer_1) { customers(:customer_1) }
    it 'has first and last name' do
      expect(customer_1.first_name).to eq 'Johny'
      expect(customer_1.last_name).to eq 'Flow'
    end
  end

  context 'associations' do
    let(:customer_1) { customers(:customer_1) }
    let(:customer_2) { customers(:customer_2) }
    let(:customer_3) { customers(:customer_3) }
    let(:customer_4) { customers(:customer_4) }

    it 'has many credit card charges' do
      expect(customer_1.credit_card_charges.count).to eq 8
      expect(customer_2.credit_card_charges.count).to eq 5
      expect(customer_3.credit_card_charges.count).to eq 4
      expect(customer_4.credit_card_charges.count).to eq 3
    end
  end
end
