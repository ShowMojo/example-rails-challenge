require 'rails_helper'

RSpec.describe "credit_card_charges/index", type: :view do
  before(:each) do
    assign(:credit_card_charges, [
      CreditCardCharge.create!(
        :customer => nil,
        :paid => false,
        :amount => 2,
        :currency => "Currency",
        :refunded => false
      ),
      CreditCardCharge.create!(
        :customer => nil,
        :paid => false,
        :amount => 2,
        :currency => "Currency",
        :refunded => false
      )
    ])
  end

  it "renders a list of credit_card_charges" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
