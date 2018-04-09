require 'rails_helper'

RSpec.describe "credit_card_charges/index", type: :view do
  before(:each) do
      @failed = [CreditCardCharge.create!(:paid => false,:amount => 9.99,:currency => "Usd",:refunded => false,:customer_id => 2)]
      @successful = [CreditCardCharge.create!(:paid => false,:amount => 9.99,:currency => "Usd",:refunded => true,:customer_id => 2)]
      @disputed = [CreditCardCharge.create!(:paid => true,:amount => 9.99,:currency => "Usd",:refunded => false,:customer_id => 2)]
  end

  it "renders 3 lists headers" do
    render
    assert_select "h1", :text => "Failed Charges"
    assert_select "h1", :text => "Disputed Charges"
    assert_select "h1", :text => "Successful Charges"
  end

end
