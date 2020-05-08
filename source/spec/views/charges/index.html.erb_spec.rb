require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    customer = build(:customer)

    5.times do
      create(:charge, paid: false, refunded: false, customer: customer)
    end

    5.times do
      create(:charge, paid: true, refunded: true, customer: customer)
    end

    10.times do
      create(:charge, paid: true, refunded: false, customer: customer)
    end

    charges = Charge.all
    assign(:charges, charges)
  end

  it "renders a header of failed charges" do
    render
    assert_select 'h1', text: 'Failed Charges', count: 1
  end

  it "renders a header of disputed charges" do
    render
    assert_select 'h1', text: 'Disputed Charges', count: 1
  end

  it "renders a header of successful charges" do
    render
    assert_select 'h1', text: 'Successful Charges', count: 1
  end

  it "renders a list of failed charges" do
    render
    assert_select '.failed', count: 5
  end

  it "renders a list of disputed charges" do
    render
    assert_select '.disputed', count: 5
  end

  it "renders a list of successful charges" do
    render
    assert_select '.successful', count: 10
  end
end
