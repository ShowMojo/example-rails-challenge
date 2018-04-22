require 'rails_helper'

feature 'ListCharges', type: :feature do
  it 'Contains all charges statuses' do
  	visit charges_path

  	expect(page).to have_css 'h1', text: 'Failed Charges'
    expect(page).to have_css 'h1', text: 'Disputed Charges'
    expect(page).to have_css 'h1', text: 'Successful Charges'
  end

  it "lists 10 successful transactions" do
  	10.times { create(:charge, :successful) }

    visit charges_path

    expect(page).to have_css '.successful tbody tr', count: 10
  end

  it "lists 5 disputed transactions" do
  	5.times { create(:charge, :disputed) }

    visit charges_path

    expect(page).to have_css '.disputed tbody tr', count: 5
  end

  it "lists 5 transactions that failed" do
    5.times { create(:charge, :failed) }

    visit charges_path

    expect(page).to have_css '.failed tbody tr', count: 5
  end
end
