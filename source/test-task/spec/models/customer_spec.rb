require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "#full_name" do
    it "should concat first name and last name" do
      customer = Customer.new(first_name: "Johny", last_name: "Flow")
      expect(customer.full_name).to eql("Johny Flow")
    end
  end
end
