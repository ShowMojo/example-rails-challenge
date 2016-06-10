require 'rails_helper'

RSpec.describe Charge, type: :model do
  
  describe "#full_name" do
  	it "should merge first name last name" do
  		customer = Customer.new(first_name: "John", last_name: "Doe")
  		expect(customer.full_name).to eql("John Doe")
  	end
  end
end
