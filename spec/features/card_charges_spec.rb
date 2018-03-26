require 'rails_helper'

feature 'Cards Charges text content' do
  scenario 'With a header for successful charges' do
    visit card_charges_path
    expect(page).to have_content('Successful Charges')
  end

  scenario 'With a header for Disputed charges' do
    visit card_charges_path
    expect(page).to have_content('Disputed Charges')
  end

  scenario 'With a header for Failed charges' do
    visit card_charges_path
    expect(page).to have_content('Failed Charges')
  end

end

feature 'Cards charges table content' do

  scenario 'There are registered 10 successful charges' do
    visit card_charges_path
    within('table.successful_charges_table/tbody') do
      expect(page).to have_xpath(".//tr", :count => 10)
    end
  end

  scenario 'There are registered 5 failed charges' do
    visit card_charges_path
    within('table.failed_charges_table/tbody') do
      expect(page).to have_xpath(".//tr", :count => 10)
    end
  end

  scenario 'there are disputed charges in the failed charges list' do
    visit card_charges_path
    page.all('table.disputed_charges_table tbody tr').each do |tr|
      puts tr.text()
      expect(page).to have_xpath(".//tr", text: tr.text() , :count => 2)
    end
  end

end
