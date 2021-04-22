require 'rails_helper'

RSpec.feature "Charges", type: :feature do
  before(:each) { load "#{Rails.root}/db/seeds.rb"}

  scenario 'Show the list of charged by group' do
    visit charges_path

    expect(page).to have_content('Failed Charges')
    expect(page).to have_content('Disputed/Refunded Charges')
    expect(page).to have_content('Successful Charges')

    expect(all('.failed tr').count).to eq(5)
    expect(all('.disputed tr').count).to eq(5)
    expect(all('.paid tr').count).to eq(10)
  end
end
