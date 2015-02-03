require 'rails_helper'

feature 'Charge index page is displayed' do
  background do
    DatabaseCleaner.clean
    load "#{Rails.root}/db/seeds.rb"
  end

  # Verify that there are three lists on the screen. One for successful charges, one for failed charges and one for the disputed charges.
  scenario 'with failed, disputed and successful lists of charges' do
    visit root_path
    expect(all('.charges ul.failed').length).to eq(1)
    expect(all('.charges ul.disputed').length).to eq(1)
    expect(all('.charges ul.successful').length).to eq(1)
  end

  # Verify that in the Successful charges list there are 10 line items.
  scenario 'with 10 successful charges' do
    visit root_path
    expect(all('.charges ul.successful li').length).to eq(10)
  end

  # Verify that in the failed charges list there are 5 line items
  scenario 'with 5 failed charges' do
    visit root_path
    expect(all('.charges ul.failed li').length).to eq(5)
  end

  # Verify that in the disputed charges list there are 5 line items
  scenario 'with 5 disputed charges' do
    visit root_path
    expect(all('.charges ul.disputed li').length).to eq(5)
  end

end
