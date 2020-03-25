require 'rails_helper'

RSpec.feature 'Credit Card Charges', type: :feature do
  before(:each) { visit '/' }

  it 'Failed charges presence' do
    expect(page).to have_css('h1', text: 'Failed charges')
  end

  it 'Disputed charges presence' do
    expect(page).to have_css('h1', text: 'Disputed charges')
  end

  it 'Successful harges presence' do
    expect(page).to have_css('h1', text: 'Successful charges')
  end

  it '10 Successful charges presence' do
    within('table.successful-charges') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  it '5 Failed charges presence' do
    within('table.failed-charges') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  it '5 Disputed charges presence' do
    within('table.disputed-charges') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end