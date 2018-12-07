require 'rails_helper'

RSpec.feature "Charges", type: :feature do

  fixtures :customers
  fixtures :charges

  it 'index has three lists on screen' do
     visit "/charges"

     expect(page).to have_selector(".failed")
     expect(page).to have_selector(".successful")
     expect(page).to have_selector(".disputed")
  end

  it 'index has 10 success charges and 5 failed charges' do
     visit "/charges"

     expect(page).to have_selector(".failed", count: 5)
     expect(page).to have_selector(".successful", count: 10)
  end

end
