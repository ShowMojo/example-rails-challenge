require 'rails_helper'

describe 'Home page' do
  it 'contains 3 tables which are Successful, Disputed and Failed charges list' do
    visit '/'

    expect(page).to have_selector('table#table_successful_charges', :count => 1)
    expect(page).to have_selector('table#table_disputed_charges', :count => 1)
    expect(page).to have_selector('table#table_failed_charges', :count => 1)

    page.should have_selector("table#table_successful_charges tr", :count => 11)
  end

  it 'has a Successful charges list with 10 lines' do
    visit '/'

    page.should have_selector("table#table_successful_charges tr", :count => 10+1)
  end

  it 'has a Failed charges list with 5 lines' do
    visit '/'

    page.should have_selector("table#table_failed_charges tr", :count => 5+1)
  end

  it 'has a Disputed charges list with 5 lines' do
    visit '/'

    page.should have_selector("table#table_disputed_charges tr", :count => 5+1)
  end
end