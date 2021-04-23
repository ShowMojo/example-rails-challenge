require 'rails_helper'
require 'rake'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:failed_charges, Transaction.failed_charges)
    assign(:disputed_charges, Transaction.disputed_charges)
    assign(:successful_charges, Transaction.successful_charges)
  end

  it "renders a list of charges" do
    render
    assert_select "ul>li", text: 'Successful Charges', count: 1
    assert_select "ul>li", text: 'Failed Charges', count: 1
    assert_select "ul>li", text: 'Disputed Charges', count: 1
    assert_select ".successful-charges>tbody>tr", count: 10
    assert_select ".failed-charges>tbody>tr", count: 5
    assert_select ".disputed-charges>tbody>tr", count: 5
  end
end
