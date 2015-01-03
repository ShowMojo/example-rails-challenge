require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :paid => false,
        :amount => "9.99",
        :currency => "",
        :refunded => false,
        :customer_id => 1
      ),
      Charge.create!(
        :paid => false,
        :amount => "9.99",
        :currency => "",
        :refunded => false,
        :customer_id => 1
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
