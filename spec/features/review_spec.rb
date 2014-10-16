require 'rails_helper'

describe "Index Page" do
 
 before(:each) do
    @user1 = FactoryGirl.create(:customer, first_name: "Johny", last_name: "Flow")
    @user2 = FactoryGirl.create(:customer, first_name: "Raj", last_name: "Jamnis")
    @user3 = FactoryGirl.create(:customer, first_name: "Andrew", last_name: "Chung")
    @user4 = FactoryGirl.create(:customer, first_name: "Mike", last_name: "Smith")
    @charge1 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
    @charge2 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
    @charge3 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
    @charge4 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
    @charge5 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
    @charge6 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 2, amount: 78.6, currency: "usd")
    @charge7 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 2, amount: 78.6, currency: "usd")
    @charge8 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 2, amount: 78.6, currency: "usd")
    @charge9 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 3, amount: 78.6, currency: "usd")
    @charge10 = FactoryGirl.create(:charge, paid: true, refunded: false, customer_id: 4, amount: 78.6, currency: "usd")
    @charge11 = FactoryGirl.create(:charge, paid: false, refunded: false, customer_id: 3, amount: 123.4, currency: "usd")
    @charge12 = FactoryGirl.create(:charge, paid: false, refunded: false, customer_id: 3, amount: 123.4, currency: "usd")
    @charge13 = FactoryGirl.create(:charge, paid: false, refunded: false, customer_id: 3, amount: 123.4, currency: "usd")
    @charge14 = FactoryGirl.create(:charge, paid: false, refunded: false, customer_id: 4, amount: 123.4, currency: "usd")
    @charge15 = FactoryGirl.create(:charge, paid: false, refunded: true, customer_id: 1, amount: 628.41, currency: "usd")
    @charge16 = FactoryGirl.create(:charge, paid: false, refunded: true, customer_id: 1, amount: 628.41, currency: "usd")
    @charge17 = FactoryGirl.create(:charge, paid: false, refunded: true, customer_id: 1, amount: 628.41, currency: "usd")
    @charge18 = FactoryGirl.create(:charge, paid: false, refunded: true, customer_id: 2, amount: 628.41, currency: "usd")
    @charge19 = FactoryGirl.create(:charge, paid: false, refunded: true, customer_id: 2, amount: 628.41, currency: "usd")
    @charge20 = FactoryGirl.create(:charge, paid: false, refunded: false, customer_id: 4, amount: 123.4, currency: "usd")
   
  end

  it "check failed charges" do
    visit root_path
    expect(page).to have_content('Failed Charges')
  end

  it "check disputed charges" do
    visit root_path
    expect(page).to have_content('Disputed Charges')
  end

  it "check successful charges" do
    visit root_path
    expect(page).to have_content('Successful Charges')
  end

 it "check successful charges" do
    visit root_path
    expect(page).to have_selector('table#charges_success tr', :count => 11)
  end

   it "check successful charges" do
    visit root_path
    expect(page).to have_selector('table#charges_disputed tr', :count => 6)
  end

   it "check successful charges" do
    visit root_path
    expect(page).to have_selector('table#charges_failed tr', :count => 6)

  end

end
