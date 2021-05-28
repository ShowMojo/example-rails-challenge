require 'factory_bot'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    customer_1 = Customer.create(first_name: 'Jonny', last_name: 'Flow')
    customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
    customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
    customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')
    Charge.create(customer: customer_1, paid: true, created: 1231221322, amount: 5000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_1, paid: true, created: 2545654564, amount: 6000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_1, paid: true, created: 4534534534, amount: 7000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_1, paid: true, created: 4534534534, amount: 8000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_1, paid: true, created: 4534534534, amount: 9000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_2, paid: true, created: 4534534534, amount: 10000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_2, paid: true, created: 1389678241, amount: 11000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_2, paid: true, created: 1389688241, amount: 12000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_3, paid: true, created: 4534534534, amount: 13000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_4, paid: true, created: 1389608241, amount: 14000, currency: 'usd', refunded: false, status: :successful)
    Charge.create(customer: customer_3, paid: false, created: 1389608241, amount: 3000, currency: 'usd', refunded: false, status: :failed)
    Charge.create(customer: customer_3, paid: false, created: 4534534534, amount: 4000, currency: 'usd', refunded: false, status: :failed)
    Charge.create(customer: customer_3, paid: false, created: 1389628241, amount: 5000, currency: 'usd', refunded: false, status: :failed)
    Charge.create(customer: customer_4, paid: false, created: 1389638241, amount: 6000, currency: 'usd', refunded: false, status: :failed)
    Charge.create(customer: customer_4, paid: false, created: 4534534534, amount: 7000, currency: 'usd', refunded: false, status: :failed)
    Charge.create(customer: customer_3, paid: false, created: 4534534534, amount: 3000, currency: 'usd', refunded: true, status: :disputed)
    Charge.create(customer: customer_3, paid: false, created: 4534534534, amount: 4000, currency: 'usd', refunded: true, status: :disputed)
    Charge.create(customer: customer_3, paid: false, created: 4534534534, amount: 5000, currency: 'usd', refunded: true, status: :disputed)
    Charge.create(customer: customer_4, paid: false, created: 4534534534, amount: 6000, currency: 'usd', refunded: true, status: :disputed)
    Charge.create(customer: customer_4, paid: false, created: 4534534534, amount: 7000, currency: 'usd', refunded: true, status: :disputed)
    assign(:charges, Charge.all)
  end
  it "renders a list of charges" do
    render
    expect(rendered).to have_selector('h1', count: 3)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('ul li', count: 5)
    expect(rendered).to have_selector('ul li', count: 10)
    expect(rendered).to have_selector('h1', text: 'Disputed Charges', count: 1)
    expect(rendered).to have_selector('ul li', count: 5)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('h1', text: 'Failed Charges', count: 1)
    expect(rendered).to have_selector('ul li', count: 10)
  end
end
