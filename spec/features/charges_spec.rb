require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before(:each) { visit charges_path }

  it 'displays Successful Charges' do
    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  it 'displays Failed Charges' do
    expect(page).to have_css('h1', text: 'Failed Charges')
  end

  it 'displays Disputed Charges' do
    expect(page).to have_css('h1', text: 'Disputed Charges')
  end
end