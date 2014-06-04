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
    assert_select "table.charges", :count => 3
  end

  it "should have 10 items in successful charges list" do
    assert_select "table.success > tbody > tr", :count => 10
  end

  it "should have 5 items in failed charges list" do
    assert_select "table.fail > tbody > tr", :count => 5
  end

  it "should have 5 items in disputed charges list" do
    assert_select "table.disput > tbody > tr", :count => 5
  end
end
