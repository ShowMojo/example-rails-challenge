require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "#full_name" do
    it "returns the customer full name" do
      customer = FactoryBot.create(:customer, first_name: "Elon", last_name: "Musk")

      expect(customer.full_name).to eq "Elon Musk"
    end
  end
end
