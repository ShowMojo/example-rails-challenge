require 'rails_helper.rb'

describe 'charges/index.html.haml' do
  before do
    assign(:failed_charges, Charge.failed.includes(:customer))
    assign(:disputed_charges, Charge.disputed.includes(:customer))
    assign(:successful_charges, Charge.successful.includes(:customer))

    render
  end

  it { expect(rendered).to have_css('#failed') }
  it { expect(rendered).to have_css('#disputed') }
  it { expect(rendered).to have_css('#successful') }

  it 'expect to have 5 failed charges' do
    expect(rendered).to have_css('#failed tr', count: 5)
  end

  it 'expect to have 5 disputed charges' do
    expect(rendered).to have_css('#disputed tr', count: 5)
  end

  it 'expect to have 10 successful charges' do
    expect(rendered).to have_css('#successful tr', count: 10)
  end
end
