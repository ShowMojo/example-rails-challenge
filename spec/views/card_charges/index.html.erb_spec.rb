require "rails_helper"

describe "card_charges/index.html.erb", type: :view do
  before :each do

    c1 = Customer.create!(firstname: 'Johny', lastname: 'Flow')
    c2 = Customer.create!(firstname: 'Raj', lastname: 'Jamnis')
    c3 = Customer.create!(firstname: 'Andrew', lastname: 'Chung')
    c4 = Customer.create!(firstname: 'Mike', lastname: 'Smith')


    # Seed 20 transactions (charges) into the system:
    # 10 Should be successful transactions:
    c1.card_charges.create!(paid: true, amount_cents: 10000, refunded: false)
    c1.card_charges.create!(paid: true, amount_cents: 20000, refunded: false)
    c1.card_charges.create!(paid: true, amount_cents: 30000, refunded: false)
    c1.card_charges.create!(paid: true, amount_cents: 40000, refunded: false)
    c1.card_charges.create!(paid: true, amount_cents: 50000, refunded: false)
    c2.card_charges.create!(paid: true, amount_cents: 10000, refunded: false)
    c2.card_charges.create!(paid: true, amount_cents: 20000, refunded: false)
    c2.card_charges.create!(paid: true, amount_cents: 30000, refunded: false)
    c3.card_charges.create!(paid: true, amount_cents: 40000, refunded: false)
    c4.card_charges.create!(paid: true, amount_cents: 50000, refunded: false)

    # 5 Should be transactions that failed:
    c3.card_charges.create!(paid: false, amount_cents: 45000, refunded: false)
    c3.card_charges.create!(paid: false, amount_cents: 35000, refunded: false)
    c3.card_charges.create!(paid: false, amount_cents: 30000, refunded: false)

    c4.card_charges.create!(paid: false, amount_cents: 55000, refunded: false)
    c4.card_charges.create!(paid: false, amount_cents: 65000, refunded: false)

    # 5 should be disputed:
    c1.card_charges.create!(paid: true, amount_cents: 10000, refunded: true)
    c1.card_charges.create!(paid: true, amount_cents: 20000, refunded: true)
    c1.card_charges.create!(paid: true, amount_cents: 30000, refunded: true)
    c2.card_charges.create!(paid: true, amount_cents: 10000, refunded: true)
    c2.card_charges.create!(paid: true, amount_cents: 20000, refunded: true)
  end

  it "displays 3 lists on the page" do
    @card_charges = CardCharge.all
    expect(render).to have_css ".failed-charges"
    expect(render).to have_css ".disputed-charges"
    expect(render).to have_css ".successful-charges"
  end

  it "successful list has 10 items" do
    @card_charges = CardCharge.all
    render
    assert_select ".successful-charges", count: 10
  end
end
