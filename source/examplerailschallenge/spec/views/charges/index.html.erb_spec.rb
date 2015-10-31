require "spec_helper"
require "rails_helper"

describe "charges/index.html.erb", type: :view do
	before(:all) do
    load "#{Rails.root}/db/seeds.rb" 
		assign(:charges, Charge.all)
  end

  after(:all) do
  	DatabaseCleaner.clean
  end

  it "displays three lists" do
    render
    expect(rendered).to have_css('table', :count => 3)
  end

  it "displays ten line items in successful charges" do
  	render
    expect(rendered).to have_css('tbody tr:not(.disputed):not(.failed)', :count => 10) 	
	end

  it "displays five line items in failed charges" do
  	render
    expect(rendered).to have_css('tbody tr.failed', :count => 5) 	
	end

  it "displays five line items in disputed charges" do
  	render
    expect(rendered).to have_css('tbody tr.disputed', :count => 5) 	
	end
end