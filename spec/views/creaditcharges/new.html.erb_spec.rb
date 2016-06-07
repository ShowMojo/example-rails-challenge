require 'rails_helper'

RSpec.describe "creaditcharges/new", type: :view do
  before(:each) do
    assign(:creaditcharge, Creaditcharge.new(
      :paid => false,
      :amount => 1,
      :currency => "MyString",
      :refunded => ""
    ))
  end

  it "renders new creaditcharge form" do
    render

    assert_select "form[action=?][method=?]", creaditcharges_path, "post" do

      assert_select "input#creaditcharge_paid[name=?]", "creaditcharge[paid]"

      assert_select "input#creaditcharge_amount[name=?]", "creaditcharge[amount]"

      assert_select "input#creaditcharge_currency[name=?]", "creaditcharge[currency]"

      assert_select "input#creaditcharge_refunded[name=?]", "creaditcharge[refunded]"
    end
  end
end
