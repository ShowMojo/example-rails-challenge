require 'rails_helper'

RSpec.describe "charges/index.html.erb", :type => :feature do
  before do
  	Rails.application.load_seed
  	visit "/charges"
  end

  #Verify that there are three lists on the screen. 
  #One for successful charges, one for failed charges and one for the disputed charges.
  it "displays successfull charges lists" do
    expect(page).to have_selector('table.success')
  end
  
  it "displays failed charges lists" do
    expect(page).to have_selector('table.failed')
  end
  
  it "displays disputed charges lists" do
    expect(page).to have_selector('table.disputed')
  end

  it "Verify that in the Successful charges list there are 10 line items." do
    page.all(:css, 'table.success tr').size == 10
  end

  it "Verify that in the failed charges list there are 5 line items." do
    page.all(:css, 'table.failed tr').size == 5
  end

  it "Verify that in the disputed charges list there are 5 line items." do
    page.all(:css, 'table.disputed tr').size == 5
  end  
end