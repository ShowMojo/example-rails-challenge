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

  scenario 'successful charges' do
    within('.charges.successful') do
      expect(page).to have_selector('tr', count: Charge.successful.count)
    end
  end

  scenario 'failed charges' do
    within('.charges.failed') do
      expect(page).to have_selector('tr', count: Charge.failed.count)
    end
  end

  scenario 'disputed charges' do
    within('.charges.disputed') do
      expect(page).to have_selector('tr', count: Charge.disputed.count)
    end
  end
end
