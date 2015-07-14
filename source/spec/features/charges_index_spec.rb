require 'rails_helper'

feature 'Charges#index' do
  background do
    load "#{Rails.root}/db/seeds.rb"
    visit charges_path
  end

  scenario 'failed charges list' do
    expect(page).to have_css("ul.failed.charges_list")
  end

  scenario 'disputed charges list' do
    expect(page).to have_css("ul.disputed.charges_list")
  end

  scenario 'successful charges list' do
    expect(page).to have_css("ul.successful.charges_list")
  end

  scenario 'successful charges list should contain 10 items' do
    expect(page).to have_css("ul.successful.charges_list li", count: 10)
  end

  scenario 'failed charges list should contain 5 items' do
    expect(page).to have_css("ul.failed.charges_list li", count: 5)
  end

  scenario 'disputed charges list should contain 5 items' do
    expect(page).to have_css("ul.disputed.charges_list li", count: Charge.disputed.count)
  end
end