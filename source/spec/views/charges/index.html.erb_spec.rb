require 'rails_helper'

describe "charges/index", type: :feature do
  it "should verify that there are three lists on the screen" do
     visit '/'
     expect(page).to have_css('.charges_container.failed', :count => 1)
     expect(page).to have_css('.charges_container.disputed', :count => 1)
     expect(page).to have_css('.charges_container.successful', :count => 1)
  end

  it "should have 10 successful charges" do
     visit '/'
     expect(page).to have_css('.charges_container.successful tr', :count => 10)
  end

  it "should have 5 failed charges" do
     visit '/'
     expect(page).to have_css('.charges_container.failed tr', :count => 5)
  end

  it "should have 5 successful disputed" do
     visit '/'
     expect(page).to have_css('.charges_container.disputed tr', :count => 5)
  end
end
