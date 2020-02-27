require "rails_helper"

RSpec.describe "Charges list", type: :feature do
  before(:context) do
    c1 = Customer.find_or_create_by!(first_name: "Johny", last_name: "Flow") 
    c2 = Customer.find_or_create_by!(first_name: "Raj", last_name: "Jamnis")
    c3 = Customer.find_or_create_by!(first_name: "Andrew", last_name: "Chung")
    c4 = Customer.find_or_create_by!(first_name: "Mike", last_name: "Smith")
    
    # successful 
    5.times do
      FactoryBot.create(:charge, paid: true, refunded: false, customer: c1)
    end
    3.times do
      FactoryBot.create(:charge, paid: true, refunded: false, customer: c2)
    end
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c3)
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c4)
  
    # failed 
    3.times do
      FactoryBot.create(:charge, paid: false, refunded: false, customer: c3)
    end
    2.times do
      FactoryBot.create(:charge, paid: false, refunded: false, customer: c4)
    end
  
    # refunded 
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
  
  it "has 3 lists as requested" do
    visit "/"
    expect(page).to have_selector('h1', text: "Failed")
    expect(page).to have_selector('h1', text: "Disputed")
    expect(page).to have_selector('h1', text: "Successful")
  end

  it "some disputed charges" do
    visit "/"
    expect(page).to have_selector('.charges-Disputed tr')
  end

  it "5 failed charges" do
    visit "/"
    expect(page).to have_selector('.charges-Failed tr', count: 5)
  end

  it "10 successful charges" do
    visit "/"
    expect(page).to have_selector('.charges-Successful tr', count: 10)
  end
end
