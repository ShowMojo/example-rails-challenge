require 'rails_helper'

RSpec.describe Charge, type: :model do
  it "should create a charge" do
  	expect(FactoryGirl.build(:charge)).to be_valid
  end
  it "should format humanized amount" do
  	expect(FactoryGirl.build(:charge, amount: 3000, currency: 1).human_amount).to be_eql("€30.00")
  end
end
