require 'rails_helper'

RSpec.describe 'charges/index', type: :view do
  before(:each) do
    Rails.application.load_seed
    charges = ChargeDecorator.decorate_collection(Charge.all)
    assign(:failed_charges, charges.select(&:failed?))
    assign(:disputed_charges, charges.select(&:disputed?))
    assign(:successful_charges, charges.select(&:successful?))
    render
  end

  it 'has lists for all charges' do
    expect(rendered).to include('Failed Charges')
    expect(rendered).to include('Disputed Charges')
    expect(rendered).to include('Successful Charges')
  end

  it 'has proper list items on each list' do
    expect(rendered).to have_selector('#failed-charges > .charge-list-item', count: 5)
    expect(rendered).to have_selector('#disputed-charges > .charge-list-item', count: 5)
    expect(rendered).to have_selector('#successful-charges > .charge-list-item', count: 10)
  end
end
