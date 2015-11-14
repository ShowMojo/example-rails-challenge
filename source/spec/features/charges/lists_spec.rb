require "rails_helper"

feature "Charges lists" do
  before { visit charges_path }

  scenario "User sees 3 charges lists" do
    expect(page).to have_content("Failed Charges")
    expect(page).to have_content("Disputed Charges")
    expect(page).to have_content("Successful Charges")

    expect(page.all("table.charges").count).to eq(3)
  end
end
