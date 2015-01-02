require_relative '../rails_helper'

feature 'Display charges' do
  background do
    DatabaseCleaner.clean
    load "#{Rails.root}/db/seeds.rb"
  end

  scenario "Display 3 different kinds of lists of charges" do
    visit '/charges'
    expect(all('.charges-container ul').length).to eq(3)
  end

  scenario "Display correct number of rows for succeeded, failed and disputed charges lists" do
    visit '/charges'
    expect(all('.succeeded-charges li').length).to eq(10)
    expect(all('.failed-charges li').length).to eq(5)
    expect(all('.disputed-charges li').length).to eq(5)
  end

end
