require 'rails_helper'

describe "Credit Card Charges " do
  it "verifies existense of successful charges table" do
    visit "/credit_card_charges"
    expect(page).to have_css 'table#successful-charges'
  end

  it "verifies existense of failed charges table" do
    visit "/credit_card_charges"
    expect(page).to have_css 'table#failed-charges'
  end

  it "verifies existense of disputed charges table" do
    visit "/credit_card_charges"
    expect(page).to have_css 'table#disputed-charges'
  end

  it "verifies existense of 10 items in successful charges table" do
    visit "/credit_card_charges"

    expect(page).to have_selector('table#successful-charges > tbody > tr', count: 10)
  end

  it "verifies existense of 5 items in failed charges table" do
    visit "/credit_card_charges"

    expect(page).to have_selector('table#failed-charges > tbody > tr', count: 5)
  end

  it "verifies existense of at least one item in disputed charges table" do
    visit "/credit_card_charges"

    expect(page).to have_selector('table#disputed-charges > tbody > tr', minimum: 1)
  end
end
