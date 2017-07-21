require 'rails_helper'

feature 'Charges/Index' do

  scenario "show correctly all charges" do
    visit charges_path
    expect(page).to have_selector("table[data-scope='failed']")
    expect(page).to have_selector("table[data-scope='disputed']")
    expect(page).to have_selector("table[data-scope='successful']")
  end

end