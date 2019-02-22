require 'rails_helper'

RSpec.describe "card_charges/index", type: :view do
  before(:all) do
    Rails.application.load_seed

    assign(:failed_charges, CardCharge.failed)
    assign(:disputed_charges, CardCharge.disputed)
    assign(:succesful_charges, CardCharge.succesful)
  end

  it "displays all the sections" do
    render
    expect(rendered).to have_tag('h1', count: 3)
  end

  it "lists 10 succesful charges" do
    render
    expect(rendered).to have_tag('.succesful.charges tbody tr', count: 10)
  end

  it "lists 5 failed charges" do
    render
    expect(rendered).to have_tag('.failed.charges tbody tr', count: 5)
  end

  it "lists 5 disputed charges" do
    render
    expect(rendered).to have_tag('.disputed.charges tbody tr', count: 5)
  end
end
