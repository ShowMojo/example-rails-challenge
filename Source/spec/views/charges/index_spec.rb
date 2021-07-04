require 'rails_helper'

describe 'charges/index.html.haml', type: :view do
  before do
    Rails.application.load_seed

    assign(:failed, Charge.failed)
    assign(:disputed, Charge.disputed)
    assign(:successful, Charge.successful)

    render
  end

  it 'renders list of failed charges' do
    expect(rendered).to have_selector('.failed.table')
  end

  it 'renders list of disputed charges' do
    expect(rendered).to have_selector('.disputed.table')
  end

  it 'renders list of successful charges' do
    expect(rendered).to have_selector('.successful.table')
  end

  it 'renders 5 line of failed charges' do
    expect(rendered).to have_selector('.failed.table.tbody.tr', count: 5)
  end

  it 'renders 5 line of disputed charges' do
    expect(rendered).to have_selector('.disputed.table.tbody.tr', count: 5)
  end

  it 'renders 10 line of successful charges' do
    expect(rendered).to have_selector('.successful.table.tbody.tr', count: 10)
  end
end