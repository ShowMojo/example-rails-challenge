require 'rails_helper'

RSpec.describe "credit_card_charges/index.html.erb", type: :view do
  before(:all) do
    assign(:payments, CreditCardCharge.all)
  end

  it "Contains 3 lists of charges" do
    render

    expect(rendered).to have_selector('table.charges', :count => 3)
  end

  it "Contains 10 successful charges" do
    render

    expect(rendered).to have_selector('.successful tbody tr', :count => 10)
  end

  it "Contains 5 failed charges" do
    render

    expect(rendered).to have_selector('.failed tbody tr', :count => 5)
  end

  it "Contains 5 disputed charges" do
    render

    expect(rendered).to have_selector('.disputed tbody tr', :count => 5)
  end
end
