require 'rails_helper'

describe "Charges" do
  it "should have three lists on the screen" do
    visit '/charges'
    expect(page).to have_css('ul#failed_charges')
    expect(page).to have_css('ul#disputed_charges')
    expect(page).to have_css('ul#successfull_charges')
  end

  it "successfull charges should have 10 line items" do
    visit '/charges'
    expect(page).to have_css('ul#successfull_charges li', count: 30) 
  end

  it "failed charges should have 5 line items" do
    visit '/charges'
    expect(page).to have_css('ul#failed_charges li', count: 15) 
  end

  it "disputed charges should have line items" do
    visit '/charges'
    expect(page).to have_css('ul#disputed_charges li', count: 15) 
  end

end