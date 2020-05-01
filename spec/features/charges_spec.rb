
require "rails_helper"

RSpec.describe "Charges list", type: :feature do
  before(:context) do
    load Rails.root + "db/seeds.rb" # a bit hacky perhaps, but saves typing! ;)
  end

  after(:context) do
    Charge.destroy_all
    Customer.destroy_all
  end

  it "shows 3 sections (Failed, Dispuated, Successful)" do
    visit "/charges"
    expect(page).to have_selector('h1', text: "Failed")
    expect(page).to have_selector('h1', text: "Disputed")
    expect(page).to have_selector('h1', text: "Successful")
  end

  it "shows some disputed charges" do
    visit "/charges"
    expect(page).to have_selector('.charges-Disputed tr')
  end

  it "shows exactly 5 failed charges" do
    visit "/charges"
    expect(page).to have_selector('.charges-Failed tr', count: 5)
  end

  it "shows exactly 10 successful charges" do
    visit "/charges"
    expect(page).to have_selector('.charges-Successful tr', count: 10)
  end
end