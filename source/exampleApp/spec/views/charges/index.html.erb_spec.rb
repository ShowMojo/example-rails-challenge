require "rails_helper"

RSpec.describe "charges/index" do
  it "contains a table for successful charges" do
    render

    expect(rendered).to match /Failed Charges/
  end
end