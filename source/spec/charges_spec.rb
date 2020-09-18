require 'rails_helper'
feature 'Charges' do
  background do
    customer = Customer.create(first_name: 'John', last_name: 'Doe')
    10.times do
      Charge.create(status: 'success', customer_id: customer.id)
    end
    5.times do
      Charge.create(status: 'failed', customer_id: customer.id)
    end
    5.times do
      Charge.create(status: 'disputed', customer_id: customer.id)
    end
  end

  scenario 'viewing the /charges' do
    visit charges_path
    expect(page).to have_current_path(charges_path)
    # Verify that there are three lists on the screen. 
    # One for successful charges, 
    # one for failed charges and one for the disputed charges.
    expect(page).to have_selector('#disputed-list')
    expect(page).to have_selector('#failed-list')
    expect(page).to have_selector('#successful-list')
    
    # Verify that in the Successful charges list there are 10 line items. 
    page.all('#successful-list tbody tr').count.should == 10
    # Verify that in the failed charges list there are 5 failed charges. 
    page.all('#failed-list tbody tr').count.should == 5
    # Verify that in the disputed charges list there are 5 disputed charges.
    page.all('#disputed-list tbody tr').count.should == 5
  end
end
