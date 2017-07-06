require 'rails_helper'

RSpec.describe "charges/edit", type: :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :customer => nil,
      :paid => false,
      :amount => 1,
      :currency => "MyString",
      :refunded => false
    ))
  end

  it "renders the edit charge form" do
    render

    assert_select "form[action=?][method=?]", charge_path(@charge), "post" do

      assert_select "input#charge_paid[name=?]", "charge[paid]"

      assert_select "input#charge_amount[name=?]", "charge[amount]"

      assert_select "input#charge_currency[name=?]", "charge[currency]"

      assert_select "input#charge_refunded[name=?]", "charge[refunded]"
    end
  end
end
