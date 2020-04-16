require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  scenario 'Check if displays Failed, Disputed and Successful charges' do
    visit charges_path

    expect(page).to have_content 'Failed Charges'
    expect(page).to have_content 'Disputed Charges'
    expect(page).to have_content 'Successful Charges'
  end

  context 'with charge data' do
    before do
      create_list(:charge, 10)
      create_list(:charge, 2, :disputed)
      create_list(:charge, 5, :failed)
    end

    scenario 'list charges correctly' do
      visit charges_path

      expect(page).to have_selector('.failed', count: 5)
      expect(page).to have_selector('.disputed', count: 2)
      expect(page).to have_selector('.successful', count: 10)
    end
  end

  context 'without charge data' do
    scenario 'see no recors message' do
      visit charges_path

      expect(page).to have_content 'No Records'
    end
  end
end
