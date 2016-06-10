require 'rails_helper'

feature 'Charges/Index' do

	scenario "Show correctly all charge lists" do
		visit charges_path
		expect(page).to have_selector("table#failed-charges")
		expect(page).to have_selector("table#disputed-charges")
		expect(page).to have_selector("table#successful-charges")
	end

end