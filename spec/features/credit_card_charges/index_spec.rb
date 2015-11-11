# Feature: Credit Card Charges Index Page
#   As a user
#   I want to see a list of credit card charges
#   So I can see what charges have been created
feature 'Credit Card Charges' do

  # Scenario: Failed Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see failed charges
  scenario 'user sees failed charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='failed table']")
  end

  scenario 'user sees successful charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='successful table']")
  end

  scenario 'user sees disputed charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='disputed table']")
  end
end