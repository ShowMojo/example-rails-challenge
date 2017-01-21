require 'rails_helper'

feature 'Charges' do
  before do
    visit charges_path
  end

  scenario 'display 3 types of charge list' do
    expect(page).to have_selector('h1', count: 3)
    expect(page).to have_content('Failed Charges')
    expect(page).to have_content('Disputed Charges')
    expect(page).to have_content('Successful Charges')

    expect(page).to have_selector('table', count: 3)
    expect(page).to have_selector('table.failed-charges')
    expect(page).to have_selector('table.disputed-charges')
    expect(page).to have_selector('table.successful-charges')
  end

  scenario 'display correct amount of charge item' do
    expect(page).to have_selector('tbody tr.successful-charged-item', count: 10)
    expect(page).to have_selector('tbody tr.failed-charged-item', count: 5)
    expect(page).to have_selector('tbody tr.disputed-charged-item', count: 5)
  end
end
