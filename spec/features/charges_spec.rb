require 'rails_helper'

describe 'Verify that there are three lists on the screen', type: :feature do
  # Verify that there are three lists on the screen.
  # One for successful charges, one for failed charges and one for the disputed charges.
  it 'should show three lists on the screen' do
    # successful charge
    create(:charge, paid: true, refunded: false)
    # disputed charge
    create(:charge, paid: true, refunded: true)
    # failed charge
    create(:charge, paid: false, refunded: false)
    visit('/charges')
    within('.successful') do
      expect(page).to have_selector('h1')
    end
    within('.disputed') do
      expect(page).to have_selector('h1')
    end
    within('.failed') do
      expect(page).to have_selector('h1')
    end
  end
end

describe 'Verify number of charges', type: :feature do
  # Verify that in the Successful charges list there are 10 line items.
  it 'should list 10 successful charges' do
    10.times { create(:charge, paid: true, refunded: false) }
    visit('/charges')
    within('.successful>table>tbody') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  # Verify that in the failed charges list there are 5 failed charges.
  it 'should list disputed charges' do
    5.times { create(:charge, paid: true, refunded: true) }
    visit('/charges')
    within('.disputed>table>tbody') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  # Verify that in the disputed charges list there are failed charges.
  it 'should list 5 failed charges' do
    5.times { create(:charge, paid: false, refunded: false) }
    visit('/charges')
    within('.failed>table>tbody') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end

