require 'rails_helper'

RSpec.describe "charges/index", type: :view do

  include ChargesHelper

  before :each do
    assign(:successful_charges, successful_charges)
    assign(:failed_charges, failed_charges)
    assign(:disputed_charges, disputed_charges)
  end

  it 'shows three lists of charges' do
    render
    expect(rendered).to have_selector('table', count: 3)
  end

  it 'shows failed charges' do
    render
    expect(rendered).to have_selector('#failed_charges h1', text: 'Failed Charges')
    expect(rendered).to have_selector('#failed_charges table')
  end

  it 'shows disputed charges' do
    render
    expect(rendered).to have_selector('#disputed_charges h1', text: 'Disputed Charges')
    expect(rendered).to have_selector('#disputed_charges table')
  end

  it 'shows successful charges' do
    render
    expect(rendered).to have_selector('#successful_charges h1', text: 'Successful Charges')
    expect(rendered).to have_selector('#successful_charges table')
  end

  it 'shows 10 items of successful charges' do
    render
    expect(rendered).to have_selector('#successful_charges table tbody tr', count: 10)
  end

  it 'shows 5 items of disputed charges' do
    render
    expect(rendered).to have_selector('#disputed_charges table tbody tr', count: 5)
  end

end
