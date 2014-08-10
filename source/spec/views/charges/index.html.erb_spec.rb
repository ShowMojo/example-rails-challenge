require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    Rails.application.load_seed # ultilize seed for testing purpose only
    assign(:failed_charges, Charge.failed)
    assign(:disputed_charges, Charge.disputed)
    assign(:successful_charges, Charge.successful)
    render
  end

  it "should show 3 lists of failed, disputed, successful charges" do
    expect(:rendered).to have_css('ul.failed')
    expect(:rendered).to have_css('ul.disputed')
    expect(:rendered).to have_css('ul.successful')
  end

  it "should show correct number of items in each list" do
    expect(:rendered).to have_css('ul.failed li', count: 5)
    expect(:rendered).to have_css('ul.disputed li', count: 5)
    expect(:rendered).to have_css('ul.successful li', count: 10)
  end
end
