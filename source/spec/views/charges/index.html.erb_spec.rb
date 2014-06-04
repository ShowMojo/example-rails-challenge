require 'rails_helper'

RSpec.describe "charges/index", :type => :view do

  before(:each) do
    assign(:charges, Charge.all)
    assign(:failed_charges, Charge.failed_charges)
    assign(:disputed_charges, Charge.disputed_charges)
    assign(:successful_charges, Charge.successful_charges)

    render
  end

  it "renders a list of charges" do
    render
  end

  it "should have three lists on the screen." do
    assert_select "table>tbody.charges", :count => 3
  end

  it "should have 10 items in successful charges list" do
    assert_select "table > tbody.success > tr", :count => 10
  end

  it "should have 5 items in failed charges list" do
    assert_select "table > tbody.fail > tr", :count => 5
  end

  it "should have 5 items in disputed charges list" do
    assert_select "table > tbody.disput > tr", :count => 5
  end
end
