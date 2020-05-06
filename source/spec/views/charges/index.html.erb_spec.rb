require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :created => 2,
        :paid => false,
        :amount => 3,
        :refunded => false,
        :currency => "Currency",
        :customer => nil
      ),
      Charge.create!(
        :created => 2,
        :paid => false,
        :amount => 3,
        :refunded => false,
        :currency => "Currency",
        :customer => nil
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
