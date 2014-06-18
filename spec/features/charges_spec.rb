require 'spec_helper'

describe 'Charges index page' do
	describe 'Lists present' do
			before :each do
		    visit '/charges'
		  end
			
			it 'should display a successful charges list' do
		    expect(page).to have_content('Successful Charges')
		    expect(page).to have_content('Transaction date')
			end

			it 'should display 10 successful charges' do
		    page.has_css?("tr.successful_charge", count: 10)
			end

			it 'should display a failed charges list' do
		    expect(page).to have_content('Failed Charges')
		    expect(page).to have_content('Dispute date')
			end

			it 'should display 5 failed charges' do
		    page.has_css?("tr.failed_charge", count: 5)
			end

			it 'should display a disputed charges list' do
		    expect(page).to have_content('Disputed Charges')
		    expect(page).to have_content('Fail date')
			end

			it 'should display 10 disputed charges' do
		    page.has_css?("tr.disputed_charge", count: 5)
			end
		end
end