require 'rails_helper'

RSpec.describe "Charge", :type => :feature do

  it "render failed charges" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Failed Charges')
  end

  it "render successful charges" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  it "render disputed charges" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  scenario '10 Should be successful transactions' do
    visit '/charges'

    within('div#charges-successful table tbody') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  scenario '5 Should be transactions that failed' do
    visit '/charges'

    within('div#charges-disputed table tbody') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  scenario 'Disputed list should contain correct number of rows' do
    visit '/charges'
    charges = Charge.where(refunded: true)

    charges.each do |charge|
      within('div#charges-disputed table tbody') do
        expect(page).to have_content(charge.customer.name)
        expect(page).to have_content(charge.amount)
        expect(page).to have_content(charge.created_at)
      end
    end
  end
end