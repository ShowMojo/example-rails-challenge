require 'rails_helper'

RSpec.feature 'Charges list' do
  scenario 'Verify that there are three lists on the screen' do
    visit '/charges'

    assert_equal 3, page.all('ol').count
  end

  scenario 'Verify that in the failed charges list there are 10 line items' do
    visit '/charges'
    page.all('ol')[0].has_selector?('li', :count => 5)
  end

  scenario 'Verify that in the disputed charges list there are 5 failed charges' do
    visit '/charges'
    page.all('ol')[1].has_selector?('li', :count => 5)
  end

  scenario 'Verify that in the successful charges list there are 10 line items' do
    visit '/charges'
    page.all('ol')[2].has_selector?('li', :count => 10)
  end
end
