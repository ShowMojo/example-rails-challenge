require 'rails_helper'
describe "credit_card_operations/charges.html.erb" do
  before do
    load "#{Rails.root}/spec/seeds.rb"
    @successful_operations = CreditCardOperation.successful
    @disputed_operations = CreditCardOperation.disputed
    @failed_operations = CreditCardOperation.failed
    render
  end

  it "contains 3 lists" do
    expect(rendered).to have_selector("ul.successful")
    expect(rendered).to have_selector("ul.failed")
    expect(rendered).to have_selector("ul.disputed")
  end

  it "contains correct operations" do
    expect(rendered).to have_selector("ul.successful li", :count => 10)
    expect(rendered).to have_selector("ul.failed li", :count => 5)
    expect(rendered).to have_selector("ul.disputed li", :count => 5)
  end
end