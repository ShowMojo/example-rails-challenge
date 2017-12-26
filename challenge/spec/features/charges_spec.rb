require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before(:each) { visit '/' }

  it 'displays Successful Charges' do
    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  it 'displays Failed Charges' do
    expect(page).to have_css('h1', text: 'Failed Charges')
  end

  it 'displays Disputed Charges' do
    expect(page).to have_css('h1', text: 'Disputed Charges')
  end

  it 'has 10 Successful charges' do
    within('table.successful-charges') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  it 'has 5 Failed charges' do
    within('table.failed-charges') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  it 'has 5 Disputed charges' do
    within('table.disputed-charges') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end
