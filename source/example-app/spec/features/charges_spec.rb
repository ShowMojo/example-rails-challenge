require "rails_helper"

RSpec.feature "Charges index", :type => :feature do
  scenario "User can see different types of charges" do
    visit "/charges/"

    expect(page).to have_text("Successful Charges")
    expect(page).to have_text("Failed Charges")
    expect(page).to have_text("Disputed Charges")

  end
end