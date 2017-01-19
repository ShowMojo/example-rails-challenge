require 'rails_helper'
describe "GET charges index", type: :feature do
  load "#{Rails.root}/db/seeds.rb"

  before do
    visit charges_path
  end

  it 'has all 3 lists' do
    expect(page).to have_selector('ul', count: 3)
    expect(page).to have_selector('ul#successful')
    expect(page).to have_selector('ul#failed')
    expect(page).to have_selector('ul#disputed')
  end

  it 'has correct amount of charges' do
    expect(page).to have_selector('ul#successful li', count: 10)
    expect(page).to have_selector('ul#failed li', count: 5)
    expect(page).to have_selector('ul#disputed li', count: 5)
  end
end
