require 'rails_helper'

describe 'charges/index.html.haml', type: :view do
  before do
    Rails.application.load_seed

    assign(:successful_charges, Charge.successful)
    assign(:failed_charges,     Charge.failed)
    assign(:disputed_charges,   Charge.disputed)

    render
  end

  it 'renders list of successful charges' do
    expect(rendered).to have_selector('.successful-charges table')
  end

  it 'renders list of failed charges' do
    expect(rendered).to have_selector('.failed-charges table')
  end

  it 'renders list of disputed charges' do
    expect(rendered).to have_selector('.disputed-charges table')
  end

  it 'renders all 10 line items in successful charges list' do
    expect(rendered).to have_selector(
      '.successful-charges table tbody tr', count: 10
    )
  end

  it 'renders all 5 line items in failed charges list' do
    expect(rendered).to have_selector(
      '.failed-charges table tbody tr', count: 5
    )
  end

  it 'renders all 5 line items in disputed charges list' do
    expect(rendered).to have_selector(
      '.disputed-charges table tbody tr', count: 5
    )
  end
end
