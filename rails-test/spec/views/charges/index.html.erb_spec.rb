require 'rails_helper'

RSpec.describe "charges/index", type: :view do

  before do
    assign(:failed_charges, FactoryGirl.create_list(:failed_charge, 5))
    assign(:disputed_charges, FactoryGirl.create_list(:disputed_charge, 5))
    assign(:successful_charges, FactoryGirl.create_list(:charge, 10))
    render
  end

  it {expect(rendered).to have_css("ul.failed_charges")}
  it {expect(rendered).to have_css("ul.disputed_charges")}
  it {expect(rendered).to have_css("ul.successful_charges")}
  it {expect(rendered).to have_css("h3", text: "Failed Charges")}
  it {expect(rendered).to have_css("h3", text: "Disputed Charges")}
  it {expect(rendered).to have_css("h3", text: "Successful Charges")}

  it {expect(rendered).to have_css("li.failed", count: 5)}
  it {expect(rendered).to have_css("li.disputed", count: 5)}
  it {expect(rendered).to have_css("li.successful", count: 10)}


end
