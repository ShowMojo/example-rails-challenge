require 'spec_helper'

class Home
  include Capybara::DSL
  def visit_homepage
    visit('/')
  end
end

RSpec.feature "Visit homepage" do
  let(:home) {Home.new}
  scenario "Able to see 3 lists for credit card charges", :js => true do
    home.visit_homepage
    expect(page).to have_content("Failed Charges")
    expect(page).to have_content("Disputed Charges")
    expect(page).to have_content("Successful Charges")
  end

  scenario "All 3 charges table have correct number of items", :js => true do
    home.visit_homepage
    expect(page).to have_css("table#successful tbody tr", count: 10)
    expect(page).to have_css("table#failed tbody tr", count: 5)
    expect(page).to have_css("table#disputed tbody tr", count: 5)
  end
end
