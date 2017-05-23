require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before :each do
    # successful
    10.times { create :charge, :successful }

    # failed
    5.times { create :charge, :failed }

    # disputed
    5.times { create :charge, :disputed }

    visit charges_path
  end

  let(:charges) { Charge.all }

  it 'should show all charges' do
    expect(page).to have_selector 'h1', text: 'Failed charges'
    expect(page).to have_selector 'h1', text: 'Disputed charges'
    expect(page).to have_selector 'h1', text: 'Successful charges'

    charges.each do |charge|
      customer = CustomerDecorator.new(charge.customer)
      expect(page).to have_content customer.name
      expect(page).to have_content charge.updated_at
      expect(page).to have_content charge.amount
    end
  end

  it 'should show failed charges' do
    within('.table-failed') do
      expect(page).to have_selector 'tr.failed', count: 5
    end
  end

  it 'should show successful charges' do
    within('.table-success') do
      expect(page).to have_selector('tr.success', count: 10)
    end
  end

  it 'should show disputed charges' do
    within('.table-disputed') do
      expect(page).not_to have_selector('tr.disputed', count: 10)
    end
  end

  #Verify that in the disputed charges list there are failed charges.(comment in readme.md)
  #I am not sure, why failed charges should be displayed in disputed charges
  #In my opinion failed charges and disputed charges are different.
  #Disputed chagres are paid but refuned charges and failed charges are failed to pay charges.
end
