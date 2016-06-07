require 'rails_helper'

RSpec.describe "creaditcharges/index", type: :view do
  before(:each) do
    assign(:creaditcharges, [
      Creaditcharge.create!(
        :paid => false,
        :amount => 1,
        :currency => "Currency",
        :refunded => ""
      ),
      Creaditcharge.create!(
        :paid => false,
        :amount => 1,
        :currency => "Currency",
        :refunded => ""
      )
    ])
  end

  it "renders a list of creaditcharges" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Currency".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
