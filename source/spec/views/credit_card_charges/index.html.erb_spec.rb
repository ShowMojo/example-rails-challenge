require "rails_helper"

describe "credit_card_charges/index.html.erb" do
  before(:each) do

    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed

    assign(:failed_charges, CreditCardCharge.failed)
    assign(:disputed_charges, CreditCardCharge.disputed)
    assign(:successful_charges, CreditCardCharge.successful)

    render
  end

  it 'shows 3 lists for charges' do
    expect(rendered).to have_selector('ul#failed_charges', count: 1)
    expect(rendered).to have_selector('ul#disputed_charges', count: 1)
    expect(rendered).to have_selector('ul#successful_charges', count: 1)
  end

  it 'has correct charges count on each list' do
    expect(rendered).to have_selector('ul#successful_charges > li', count: 10)
    expect(rendered).to have_selector('ul#failed_charges > li', count: 5)
    expect(rendered).to have_selector('ul#disputed_charges > li', count: 5)
  end

end