require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  context 'columns' do
    it 'has first and last name' do
      customer_1 = customers(:customer_1)
      expect(customer_1.first_name).to eq("Johny")
      expect(customer_1.last_name).to eq("Flow")
    end
  end
end
