require 'rails_helper'

RSpec.feature "Charges", type: :feature do
  before do
    seed_db
  end

  scenario "List of successful charges" do
    visit "/"
    expect(page).to have_css('.successful')
  end

  scenario "List of failed charges" do
    visit "/"
    expect(page).to have_css('.failed')
  end

  scenario "List of disputed charges" do
    visit "/"
    expect(page).to have_css('.disputed')
  end

  scenario 'List of all failed charges' do
    visit '/'
    expect(page).to have_css('.failed .charge', count: 5)
  end

  scenario 'List of all disputed charges' do
    visit '/'
    expect(page).to have_css('.disputed .charge', count: 5)
  end
end
