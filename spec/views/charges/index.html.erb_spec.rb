require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :paid => false,
        :amount => 2,
        :currency => "Currency",
        :refunded => false,
        :customer => ""
      ),
      Charge.create!(
        :paid => false,
        :amount => 2,
        :currency => "Currency",
        :refunded => false,
        :customer => ""
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
