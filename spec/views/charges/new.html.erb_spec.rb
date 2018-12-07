require 'rails_helper'

RSpec.describe "charges/new", type: :view do
  before(:each) do
    assign(:charge, Charge.new(
      :paid => false,
      :amount => 1,
      :currency => "MyString",
      :refunded => false,
      :customer => ""
    ))
  end

  it "renders new charge form" do
    render

    assert_select "form[action=?][method=?]", charges_path, "post" do

      assert_select "input#charge_paid[name=?]", "charge[paid]"

      assert_select "input#charge_amount[name=?]", "charge[amount]"

      assert_select "input#charge_currency[name=?]", "charge[currency]"

      assert_select "input#charge_refunded[name=?]", "charge[refunded]"

      assert_select "input#charge_customer[name=?]", "charge[customer]"
    end
  end
end
