require 'rails_helper'

RSpec.describe "the charges page", :type => :feature do
  it "displays three lists on the screen" do
    visit "/charges"
    
    # Failed List
    expect(page).to have_selector('table.failed')
    
    # Disputed List
    expect(page).to have_selector('table.disputed')
    
    # Succeeded List
    expect(page).to have_selector('table.succeeded')
  end
end