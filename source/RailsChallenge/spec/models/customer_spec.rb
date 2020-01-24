require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#first_name' do

    it "is valid with valid attributes" do
      expect(Customer.new(first_name: "Jane", last_name: "Doe")).to be_valid
    end

    it "not valid wihtout first_name" do
      auction = Customer.new(first_name: nil, last_name: "Doe")
      expect(auction).to_not be_valid
    end

    it "not valid wihtout first_name" do
      auction = Customer.new(first_name: "Jane", last_name: nil)
      expect(auction).to_not be_valid
    end

    it "not valid and have error message for first_name" do
      record = Customer.new(last_name: "Doe")
      record.valid? # run validations
      expect(record.errors[:first_name]).to include("can't be blank")

      record.first_name = 'First'
      record.valid?
      expect(record.errors[:first_name]).not_to include("can't be blank")
    end

     it "should validate last name" do
      record = Customer.new
      record.first_name = 'First'
      record.last_name = ''
      record.valid? # run validations
      expect(record.errors[:last_name]).to include("can't be blank")

      record.last_name = 'Last'
      record.valid?
      expect(record.errors[:last_name]).not_to include("can't be blank")
    end
  end
end
