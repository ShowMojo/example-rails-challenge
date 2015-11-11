require 'spec_helper'

describe 'charge' do
  it 'three list in the screen' do
    visit '/charges'
    
    find(:xpath, "//table[@class='charges failed_charges']").should be_visible
    find(:xpath, "//table[@class='charges disputed_charges']").should be_visible
    find(:xpath, "//table[@class='charges successful_charges']").should be_visible
  end
end
