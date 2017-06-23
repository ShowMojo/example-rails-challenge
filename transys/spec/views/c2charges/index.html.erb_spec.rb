require 'rails_helper'
include RSpecHtmlMatchers

RSpec.describe "c2charges/index", :type => :view do
  before do
    assign(:c2charges_failed, C2charge.where("status = 0"))
    assign(:c2charges_success, C2charge.where("status = 1"))
    assign(:c2charges_disputed, C2charge.where("status = -1"))
    render :template => "c2charges/index.html.erb"
  end

  it "has three listing" do
    expect(rendered).to have_tag('h1', :count => 3)
    expect(rendered).to have_tag('table', :count => 3)
  end

  it "Failed listing have only 5 records" do
    expect(rendered).to have_tag('h1.failed-charges-header', :text => "Listing Failed Charges")
    expect(rendered).to have_tag('table.failed-charges-table tbody tr', :count => 5)
  end

  it "Disputed listing have only 5 records" do
    expect(rendered).to have_tag('h1.disputed-charges-header', :text => "Listing Disputed Charges")
    expect(rendered).to have_tag('table.disputed-charges-table tbody tr', :count => 5)
  end

  it "Successful listing have only 10 records" do
    expect(rendered).to have_tag('h1.successful-charges-header', :text => "Listing Successful Charges")
    expect(rendered).to have_tag('table.successful-charges-table tbody tr', :count => 10)
  end
end