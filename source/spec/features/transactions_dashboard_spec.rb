require "rails_helper"

RSpec.feature 'Charges', type: :feature do
  before :each do
    visit root_path
  end

  it 'should show three kind of charges' do
    expect(page).to have_selector('h1', text: 'Failed Charges')
    expect(page).to have_selector('h1', text: 'Disputed Charges')
    expect(page).to have_selector('h1', text: 'Successful Charges')
  end

  it 'should show successful charges' do 
    within('.list-successful') do
      expect(page).to have_selector('tr.successful', count: 10)
    end
  end

  it 'should show failed charges' do
    within('.list-failed') do
      expect(page).to have_selector('tr.failed', count: 5)
    end
  end

  it 'should show disputed charges' do
    within('.list-disputed') do
      expect(page).to have_selector('tr.disputed', count: 5)
    end
  end
end