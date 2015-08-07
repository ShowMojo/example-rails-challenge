require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "should create a customer" do
  	expect(FactoryGirl.build(:customer)).to be_valid
  end
end
