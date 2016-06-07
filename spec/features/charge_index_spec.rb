require "rails_helper"

RSpec.feature "Charges index", :type => :feature do  
  before do
    @customer_1 = FactoryGirl.create(:customer, fname: 'Johny', lname: 'Flow')
    @customer_2 = FactoryGirl.create(:customer, fname: 'Raj', lname: 'Jamnis')
    @customer_3 = FactoryGirl.create(:customer, fname: 'Andrew', lname: 'Chung')
    @customer_4 = FactoryGirl.create(:customer, fname: 'Mike', lname: 'Smith')

    5.times {FactoryGirl.create(:charge, paid: true, refunded: false, amount: rand(0..10000), customer: @customer_1)}
    3.times {FactoryGirl.create(:charge, paid: true, refunded: false, amount: rand(0..10000), customer: @customer_2)}
    1.times {FactoryGirl.create(:charge, paid: true, refunded: false, amount: rand(0..10000), customer: @customer_3)}
    1.times {FactoryGirl.create(:charge, paid: true, refunded: false, amount: rand(0..10000), customer: @customer_4)}
    
    3.times {FactoryGirl.create(:charge, paid: false, refunded: false, amount: rand(0..10000), customer: @customer_3)}
    2.times {FactoryGirl.create(:charge, paid: false, refunded: false, amount: rand(0..10000), customer: @customer_4)}
    
    3.times {FactoryGirl.create(:charge, paid: true, refunded: true, amount: rand(0..10000), customer: @customer_1)}
    2.times {FactoryGirl.create(:charge, paid: true, refunded: true, amount: rand(0..10000), customer: @customer_2)}
  end

  scenario "There are three lists on the charges page." do
    visit "/charges"
    
    list = find('ul').all('li')
    expect(list.count).to eq 3
    expect(list[0]).to have_text("Failed Charges")
    expect(list[1]).to have_text("Disputed Charges")
    expect(list[2]).to have_text("Successful Charges")

  end

  scenario "Verify that in the Successful charges list there are 10 line items. 
            Verify that in the failed charges list there are 5 failed charges. 
            Verify that in the disputed charges list there are failed charges." do
    visit "/charges"
    # table header row make plus one(+1)
    expect(find('ul li#successful-charges').all('tr').count).to eq 10+1
    expect(find('ul li#failed-charges').all('tr').count).to eq 5+1
    expect(find('ul li#disputed-charges').all('tr').count).to eq 5+1
  end 
end