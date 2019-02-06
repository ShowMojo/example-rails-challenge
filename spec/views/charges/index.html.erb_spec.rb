require "rails_helper"

RSpec.describe "charges/index" do
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 

    assign(:charges, Charge.all)
    render
  end

  it "displays all 3 tables/lists" do
    expect(rendered).to have_selector('table', count: 3)

    expect(rendered).to have_selector('h1', text: 'Successful Charges')
    expect(rendered).to have_selector('h1', text: 'Failed Charges')
    expect(rendered).to have_selector('h1', text: 'Disputed Charges')
  end

  it "should have correct number of charges in each list" do
    expect(rendered).to have_selector('tr.disputed', count: 5)
    expect(rendered).to have_selector('tr.failed', count: 5)
    expect(rendered).to have_selector('tr.successful', count: 10)
  end
end