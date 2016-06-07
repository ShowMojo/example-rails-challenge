require 'rails_helper'

RSpec.describe "creaditcharges/edit", type: :view do
  before(:each) do
    @creaditcharge = assign(:creaditcharge, Creaditcharge.create!(
      :paid => false,
      :amount => 1,
      :currency => "MyString",
      :refunded => ""
    ))
  end

  it "renders the edit creaditcharge form" do
    render

    assert_select "form[action=?][method=?]", creaditcharge_path(@creaditcharge), "post" do

      assert_select "input#creaditcharge_paid[name=?]", "creaditcharge[paid]"

      assert_select "input#creaditcharge_amount[name=?]", "creaditcharge[amount]"

      assert_select "input#creaditcharge_currency[name=?]", "creaditcharge[currency]"

      assert_select "input#creaditcharge_refunded[name=?]", "creaditcharge[refunded]"
    end
  end
end
