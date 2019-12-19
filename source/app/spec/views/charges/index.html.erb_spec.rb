require "rails_helper"

RSpec.describe "charges/index" do
  before do
    @failed = assign(:failed, Charge.failed)
    @successful = assign(:successful, Charge.successful)
    @disputed = assign(:disputed, Charge.disputed)
  end

  it "displays 3 types charges" do
    render

    expect(rendered).to match /Failed Charges/
    expect(rendered).to match /Disputed Charges/
    expect(rendered).to match /Successful Charges/
  end
end