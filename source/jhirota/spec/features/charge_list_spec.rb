require 'rails_helper'

RSpec.describe "credit_card_charges list", type: :feature do
	before do
    Rails.application.load_seed
		visit "/"
	end

	# Verify that there are three lists on the screen.
	it "displays successfull charges lists" do
		expect(page).to have_selector('div.succed-charges', count: 1)
    expect(page).to have_css 'div.succed-charges h1', text: 'Successful Charges'
	end

	it "displays failed charges lists" do
		expect(page).to have_selector('div.failed-charges', count: 1)
    expect(page).to have_css 'div.failed-charges h1', text: 'Failed Charges'
	end

	it "displays disputed charges lists" do
		expect(page).to have_selector('div.disputed-charges', count: 1)
    expect(page).to have_css 'div.disputed-charges h1', text: 'Disputed Charges'
	end

	it "Verify that in the Successful charges list there are 10 line items." do
		within('div.succed-charges') do
			expect(page).to have_css("div.transaction", count: 10)
		end
	end

	it "Verify that in the failed charges list there are 5 line items." do
    within('div.failed-charges') do
			expect(page).to have_css("div.transaction", count: 5)
		end
	end

	it "Verify that in the disputed charges list there are failed charges." do
    within('div.disputed-charges') do
			expect(page).to have_css("div.transaction", count: 5)
		end
	end
end
