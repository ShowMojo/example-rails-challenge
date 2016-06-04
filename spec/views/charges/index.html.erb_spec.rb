require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  # before(:each) do
  #   assign(:charges, [
  #     Charge.create!(
  #       :paid => false,
  #       :amount => 1,
  #       :currency => "Currency",
  #       :refunded => false,
  #       :customer_id => 2
  #     ),
  #     Charge.create!(
  #       :paid => false,
  #       :amount => 1,
  #       :currency => "Currency",
  #       :refunded => false,
  #       :customer_id => 2
  #     )
  #   ])
  # end

  it "renders a list of charges" do
    render
    assert_select "body>h1", :count => 3
    assert_select "div.failed", :count => Charge.failed.count
    # assert_select "tr>td", :text => "Currency".to_s, :count => 2
    # assert_select "tr>td", :text => false.to_s, :count => 2
    # assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
