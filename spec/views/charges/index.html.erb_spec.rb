# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'charges/index', type: :view do
  it 'verifies that there are three lists on the screen' do
    assign(:charges, Charge)
    render

    expect(rendered).to have_css('h1', text: 'Failed Charges')
    expect(rendered).to have_css('h1', text: 'Disputed Charges')
    expect(rendered).to have_css('h1', text: 'Successful Charges')
  end

  it 'verifies 10 items in success, 5 in failed and disputed' do
    assign(:charges, Charge)
    render
    expect(rendered).to have_css('.successful tbody tr', count: 10)
    expect(rendered).to have_css('.failed tbody tr', count: 5)
    expect(rendered).to have_css('.disputed tbody tr', count: 5)
  end
end
