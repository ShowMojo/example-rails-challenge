require "rails_helper"

RSpec.describe "Charges list", type: :feature do
  before(:context) do
    c1 = Customer.find_or_create_by!(
      first_name: "Johny",
      last_name:  "Flow"
    )
    
    c2 = Customer.find_or_create_by!(
      first_name: "Raj",
      last_name:  "Jamnis"
    )
    
    c3 = Customer.find_or_create_by!(
      first_name: "Andrew",
      last_name:  "Chung"
    )
    
    c4 = Customer.find_or_create_by!(
      first_name: "Mike",
      last_name:  "Smith"
    )
    
    # successful ones
    5.times do
      FactoryBot.create(:charge, paid: true, refunded: false, customer: c1)
    end
    3.times do
      FactoryBot.create(:charge, paid: true, refunded: false, customer: c2)
    end
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c3)
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c4)
  
    # failed ones
    3.times do
      FactoryBot.create(:charge, paid: false, refunded: false, customer: c3)
    end
    2.times do
      FactoryBot.create(:charge, paid: false, refunded: false, customer: c4)
    end
  
    # refunded ones
    3.times do
      FactoryBot.create(:charge, paid: true, refunded: true, customer: c1)
    end
    2.times do
      FactoryBot.create(:charge, paid: true, refunded: true, customer: c2)
    end
  end

  after(:context) do
    Charge.destroy_all
    Customer.destroy_all
  end
  
  it "has 3 lists" do
    visit "/"
    expect(page).to have_selector('h1.center', text: "Failed")
    expect(page).to have_selector('h1.center', text: "Disputed")
    expect(page).to have_selector('h1.center', text: "Successful")
  end

  it "has 10 chages in succesfull section" do
    visit "/"
    expect(page).to have_selector('.items-successful tr', count: 10)
  end

  it "has 5 chages in failed section" do
    visit "/"
    expect(page).to have_selector('.items-failed tr', count: 5)
  end

  it "has some chages in disputed section" do
    visit "/"
    expect(page).to have_selector('.items-disputed tr')
  end
end
