require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before do
    create_list(:charge, 5, paid: false)
    create_list(:charge, 3, paid: true, refunded: false)
    create_list(:charge, 2, paid: true, refunded: true)
    assign(:charges, Charge.all)
    render
  end

  it 'contains three headers' do
    assert_select 'h1', count: 3
  end

  it "renders a list of charges" do
    assert_select 'tr.customer', count: 10
    assert_select 'tr.header', count: 3
  end
end
