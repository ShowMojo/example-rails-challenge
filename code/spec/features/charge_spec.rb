require "rails_helper"

RSpec.feature "Charges", :type => :feature do
  before do
    customer1 = FactoryGirl.create(:customer, first_name: 'Johny', last_name: 'Flow')
    customer2 = FactoryGirl.create(:customer, first_name: 'Raj', last_name: 'Jamnis')
    customer3 = FactoryGirl.create(:customer, first_name: 'Andrew', last_name: 'Chung')
    customer4 = FactoryGirl.create(:customer, first_name: 'Mike', last_name: 'Smith')

    #Successful charges
    5.times {FactoryGirl.create(:charge, customer: customer1)}
    3.times {FactoryGirl.create(:charge, customer: customer2)}
    1.times {FactoryGirl.create(:charge, customer: customer3)}
    1.times {FactoryGirl.create(:charge, customer: customer4)}
    
    #Failed charges
    3.times {FactoryGirl.create(:charge, paid: false, customer: customer3)}
    2.times {FactoryGirl.create(:charge, paid: false, customer: customer4)}

    #Disputed charges
    3.times {FactoryGirl.create(:charge, refunded: true, customer: customer1)}
    2.times {FactoryGirl.create(:charge, refunded: true, customer: customer2)}
  end

  before(:each) { visit '/charges' }
  
  scenario "There are three lists on the screen" do
    expect(page).to have_css('h1', text: 'Successful Charges')
    expect(page).to have_css('h1', text: 'Failed Charges')
    expect(page).to have_css('h1', text: 'Disputed Charges')
  end

  scenario "Successful charges list should contain 10 rows" do
    within('li.successful table tbody') do
      expect(page).to have_selector('tr', count: 10)
    end
  end

  scenario "Failed charges list should contain 5 rows" do
    within('li.failed table tbody') do
      expect(page).to have_selector('tr', count: 5)
    end
  end

  scenario "Disputed charges list should contain 5 rows" do
    within('li.disputed table tbody') do
      expect(page).to have_selector('tr', count: 5)
    end
  end
end
