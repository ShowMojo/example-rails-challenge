require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before do
    Rails.application.load_seed
  end

  before(:each) { visit '/charges' }

  scenario 'show all kinds of charges' do
    expect(page).to have_css('h1', text: 'Failed Charges')
    expect(page).to have_css('h1', text: 'Disputed Charges')
    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  scenario 'Successful charges should contain correct number of rows' do
    within('.charges.successful') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  scenario 'Failed charges should contain correct number of rows' do
    within('.charges.failed') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  scenario 'Disputed charges should contain correct number of rows' do
    within('.charges.disputed') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end
