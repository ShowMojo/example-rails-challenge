require "rails_helper"
RSpec.feature "Charges lists are present", :type => :feature do

  before(:all) do
    Rails.application.load_seed
  end

  scenario "User checks list of credit charges" do
    visit "/credit_card_charges"
    expect(page).to have_selector("h1", text: 'Failed Charges')
    expect(page).to have_selector("h1", text: 'Disputed Charges')
    expect(page).to have_selector("h1", text: 'Successful Charges')

    expect(page).to have_selector("tr", class: 'successful', count: 10)
    expect(page).to have_selector("tr", class: 'failed', count: 5)
    expect(page).to have_selector("tr", class: 'disputed', count: 5)
  end
end
