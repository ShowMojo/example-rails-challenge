require 'rails_helper'

RSpec.describe 'Charges page', type: :feature do
  it 'displays up to 5 charges that failed' do
    create_list(:failed_charge, 10, amount: 1_000)

    visit charges_path

    expect(page).to have_selector('h1', text: 'Failed Charges')
    within '.table-failed>tbody' do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  it 'displays charges that are in dispute' do
    create_list(:disputed_charge, 3, amount: 1_000)

    visit charges_path

    expect(page).to have_selector('h1', text: 'Disputed Charges')
  end

  it 'displays up to 10 charges that are successful' do
    create_list(:successful_charge, 11, amount: 1_000)

    visit charges_path

    expect(page).to have_selector('h1', text: 'Successful Charges')
    within '.table-successful>tbody' do
      expect(page).to have_selector('tr', count: 10)
    end
  end
end
