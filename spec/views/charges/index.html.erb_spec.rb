require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(
        :customer => nil,
        :paid => false,
        :amount => 2.5,
        :currency => "Currency",
        :refunded => false
      ),
      Charge.create!(
        :customer => nil,
        :paid => false,
        :amount => 2.5,
        :currency => "Currency",
        :refunded => false
      )
    ])
  end

  it "renders a list of charges" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
