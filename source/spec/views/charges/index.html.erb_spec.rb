require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    cus1 = create(:customer, first_name: 'Jonny', last_name: 'Flow')
    cus2 = create(:customer, first_name: 'Raj', last_name: 'Jamnis')
    cus3 = create(:customer, first_name: 'Andrew', last_name: 'Chung')
    cus4 = create(:customer, first_name: 'Mike', last_name: 'Smith')

    create(:charge, customer: cus1, paid: true, created: 1389618241, amount: 5000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389628241, amount: 6000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389638241, amount: 7000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389648241, amount: 8000, currency: 'usd', refunded: false)
    create(:charge, customer: cus1, paid: true, created: 1389658241, amount: 9000, currency: 'usd', refunded: false)
    create(:charge, customer: cus2, paid: true, created: 1389668241, amount: 10000, currency: 'usd', refunded: false)
    create(:charge, customer: cus2, paid: true, created: 1389678241, amount: 11000, currency: 'usd', refunded: false)
    create(:charge, customer: cus2, paid: true, created: 1389688241, amount: 12000, currency: 'usd', refunded: false)
    create(:charge, customer: cus3, paid: true, created: 1389698241, amount: 13000, currency: 'usd', refunded: false)
    create(:charge, customer: cus4, paid: true, created: 1389608241, amount: 14000, currency: 'usd', refunded: false)

    create(:charge, customer: cus3, paid: false, created: 1389608241, amount: 3000, currency: 'usd', refunded: false)
    create(:charge, customer: cus3, paid: false, created: 1389618241, amount: 4000, currency: 'usd', refunded: false)
    create(:charge, customer: cus3, paid: false, created: 1389628241, amount: 5000, currency: 'usd', refunded: false)

    create(:charge, customer: cus4, paid: false, created: 1389638241, amount: 6000, currency: 'usd', refunded: false)
    create(:charge, customer: cus4, paid: false, created: 1389648241, amount: 7000, currency: 'usd', refunded: false)

    create(:charge, customer: cus3, paid: false, created: 1389648241, amount: 3000, currency: 'usd', refunded: true)
    create(:charge, customer: cus3, paid: false, created: 1389658241, amount: 4000, currency: 'usd', refunded: true)
    create(:charge, customer: cus3, paid: false, created: 1389668241, amount: 5000, currency: 'usd', refunded: true)

    create(:charge, customer: cus4, paid: false, created: 1389678241, amount: 6000, currency: 'usd', refunded: true)
    create(:charge, customer: cus4, paid: false, created: 1389688241, amount: 7000, currency: 'usd', refunded: true)

    assign(:charges, Charge.all)
  end

  it "renders a list of charges" do
    render

    expect(rendered).to have_selector('h1', count: 3)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('table.failed tbody tr', count: 10)

    expect(rendered).to have_selector('h1', text: 'Disputed Charges', count: 1)
    expect(rendered).to have_selector('table.disputed tbody tr', count: 5)

    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('table.success tbody tr', count: 10)
  end
end
