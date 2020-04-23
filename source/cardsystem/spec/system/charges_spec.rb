require 'rails_helper'

RSpec.describe "Charges", type: :system do
  it "shows all 3 lists" do
    visit "/charges"

    expect(page).to have_selector("ul", count: 3)
    expect(page).to have_selector("h1", count: 3)
    expect(page).to have_content("Failed Charges")
    expect(page).to have_content("Disputed Charges")
    expect(page).to have_content("Successful Charges")
  end

  it "lists have correct number of lines" do
    visit "/charges"
    expect(page).to have_selector("#successful-charges > li", count: 10)
    expect(page).to have_selector("#failed-charges > li", count: 5)
    expect(page).to have_selector("#disputed-charges > li", count: 5)
  end
end