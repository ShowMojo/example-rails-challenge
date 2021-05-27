require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    @customer_1 = FactoryBot.create(:customer, first_name: 'Johny', last_name: 'Flow')
    @customer_2 = FactoryBot.create(:customer, first_name: 'Raj', last_name: 'Jamnis')
    @customer_3 = FactoryBot.create(:customer, first_name: 'Andrew', last_name: 'Chung')
    @customer_4 = FactoryBot.create(:customer, first_name: 'Mike', last_name: 'Smith')
    5.times{ FactoryBot.create(:charge, customer: @customer_1, paid: true, refunded: false) }

    3.times{ FactoryBot.create(:charge, customer: @customer_2, paid: true, refunded: false) }
    FactoryBot.create(:charge, customer: @customer_3, paid: true, refunded: false)

    FactoryBot.create(:charge, customer: @customer_4, paid: true, refunded: false)

    3.times{ FactoryBot.create(:charge, customer: @customer_3, paid: false) }

    2.times{ FactoryBot.create(:charge, customer: @customer_4, paid: false) }

    3.times{ FactoryBot.create(:charge, customer: @customer_1, paid: true, refunded: true) }

    2.times{ FactoryBot.create(:charge, customer: @customer_2, paid: true, refunded: true) }

    assign(:charges, Charge.all)
  end

  it "renders a list of charges" do
    render
    # Verify that there are three lists on the screen.
    # one for successful charges,
    expect(render).to have_content('Successful Charges')
    # one for failed charges and
    expect(render).to have_content('Failed Charges')
    # one for the disputed charges.
    expect(render).to have_content('Disputed Charges')

    #Verify that in the Successful charges list there are 10 line items.
    expect(render).to have_selector "tr.successful", count: 10

    # Verify that in the failed charges list there are 5 failed charges.
    expect(render).to have_selector "tr.failed", count: 5

    # Verify that in the disputed charges list there are 5 disputed charges.
    expect(render).to have_selector "tr.disputed", count: 5
  end
end
