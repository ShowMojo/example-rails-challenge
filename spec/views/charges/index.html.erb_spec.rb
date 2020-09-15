require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before do
    create_list(:charge, 5, paid: false)
    create_list(:charge, 3, paid: true, refunded: false)
    create_list(:charge, 2, paid: true, refunded: true)
  end

  it "renders a list of charges" do
    render
    assert_select "table.table.failed>td", :count => 5
  end
end
