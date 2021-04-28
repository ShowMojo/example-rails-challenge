require "rails_helper"

feature "Charges are listed" do
  scenario "displays Successful, Failed, and Disputed Lists" do
    visit charges_path

    expect(page).to have_content("Successful Charges")
    expect(page).to have_content("Failed Charges")
    expect(page).to have_content("Disputed Charges")
  end

  scenario "lists correct number of charges" do
    create_list(:charge, 10)
    create_list(:charge, 5, :failed)
    create_list(:charge, 2, :disputed)

    visit charges_path

    expect(page).to have_selector('.successful', count: 10)
    expect(page).to have_selector('.failed', count: 5)
    expect(page).to have_selector('.disputed', count: 2)
  end
end
