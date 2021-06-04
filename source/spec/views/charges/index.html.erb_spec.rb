require "rails_helper"

RSpec.describe "charges/index" do
  it "displays all the charges" do
    render
    expect(rendered).to have_selector('h1', text: 'Failed Charges')
    expect(rendered).to have_selector('h1', text: 'Disputed Charges')
    expect(rendered).to have_selector('h1', text: 'Successful Charges')
    expect(rendered).to have_selector('table.failed-charges')
    expect(rendered).to have_selector('table.disputed-charges')
    expect(rendered).to have_selector('table.successful-charges')
  end

  it "verify charges count" do
    render
    expect(rendered).to have_xpath(".//table[@class='successful-charges']//tbody//tr", count: 10)
    expect(rendered).to have_xpath(".//table[@class='failed-charges']//tbody//tr", count: 5)
    expect(rendered).to have_xpath(".//table[@class='disputed-charges']//tbody//tr", count: 5)
  end
end