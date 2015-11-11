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

  # Scenario: Successful Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see successful charges
  scenario 'user sees successful charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='successful table']")
  end

  # Scenario: Disputed Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see disputed charges
  scenario 'user sees disputed charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='disputed table']")
  end

  # Scenario: Successful Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see 10 successful charges
  scenario 'user sees 10 successful charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='successful table'] tr[class=charge]", count: 10)
  end

  # Scenario: Failed Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see 5 failed charges
  scenario 'user sees 5 failed charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='failed table'] tr[class=charge]", count: 5)
  end

  # Scenario: Disputed Charges on index page
  #   Given I am signed in
  #   When I visit the charges index page
  #   Then I see 5 disputed charges
  scenario 'user sees 5 disputed charges' do
    visit credit_card_charges_path
    expect(page).to have_selector(:css, "table[class='disputed table'] tr[class=charge]", count: 5)
  end
end