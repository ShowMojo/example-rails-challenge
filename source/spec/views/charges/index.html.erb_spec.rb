require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    cus1 = FactoryBot.create(:customer, first_name: 'Jonny', last_name: 'Flow')
    cus2 = create(:customer, first_name: 'Raj', last_name: 'Jamnis')
    cus3 = create(:customer, first_name: 'Andrew', last_name: 'Chung')
    cus4 = create(:customer, first_name: 'Mike', last_name: 'Smith')

    create(:charge, customer: cus1, paid: true, created: 1389618241, amount: 5000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389628241, amount: 6000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389638241, amount: 7000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389648241, amount: 8000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389658241, amount: 9000, currency: 'usd', refunded: false)

    assign(:charges, Charge.all)
  end

  it "renders a list of charges" do
    render

    expect(rendered).to have_selector('h1', count: 3)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('table.failed tbody tr', count: 5)

    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
  end
end
