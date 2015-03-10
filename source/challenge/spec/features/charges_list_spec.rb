require 'rails_helper'

feature 'Charges index page displays' do

  background do
    DatabaseCleaner.clean
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario 'three lists' do
    visit charges_path
    expect(all('.charges ul.failed').length).to eq(1)
    expect(all('.charges ul.disputed').length).to eq(1)
    expect(all('.charges ul.successful').length).to eq(1)
  end

  scenario '10 successful charges in successful list' do
    visit charges_path
    expect(all('.charges ul.successful li').length).to eq(10)
  end

  scenario '5 failed charges in failed list' do
    visit charges_path
    expect(all('.charges ul.failed li').length).to eq(5)
  end

  scenario 'more than 0 disputed charges in disputed list' do
    visit charges_path
    expect(all('.charges ul.disputed li').length).to be > 0
  end
end