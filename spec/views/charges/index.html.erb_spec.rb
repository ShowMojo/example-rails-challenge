require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  it "verifies that there are three lists on the screen" do
    assign(:charges, Charge)
    render

    expect(rendered).to match("Failed Charges")
    expect(rendered).to match("Disputed Charges")
    expect(rendered).to match("Successful Charges")
  end

  it 'verifies 10 items in success, 5 in failed and disputed' do
    assign(:charges, Charge)
    render
    expect(rendered).to have_css('.successful tbody tr', count: 10)
    expect(rendered).to have_css('.failed tbody tr', count: 5)
    expect(rendered).to have_css('.disputed tbody tr', count: 5)
  end
end
