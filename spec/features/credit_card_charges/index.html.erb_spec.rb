require 'rails_helper'

describe 'credit_card_charges/index.html.erb' do
	before(:each) do
    visit root_path
  end

  it 'verify showing failed table' do
  	page.should have_css('table#failed_charges')
  end

  it 'verify showing disputed table' do
    page.should have_css('table#disputed_charges')
  end

  it 'verify showing succeed table' do
    page.should have_css('table#succeed_charges')
  end

  it 'verify succeed table rows' do\
    page.should have_css("table#succeed_charges tbody tr", :count => 10)
  end

  it 'verify failed table rows' do
    page.should have_css("table#failed_charges tbody tr", :count => 5)
  end

  it 'verify disputed table rows' do
    page.should have_css("table#disputed_charges tbody tr", :count => 5)
  end
end