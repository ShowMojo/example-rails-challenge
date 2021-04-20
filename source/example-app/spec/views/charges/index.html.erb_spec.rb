require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :created => 2,
        :paid => false,
        :amount => "9.99",
        :currency => "Currency",
        :refunded => false,
        :customer => nil
      ),
      Charge.create!(
        :created => 2,
        :paid => false,
        :amount => "9.99",
        :currency => "Currency",
        :refunded => false,
        :customer => nil
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
