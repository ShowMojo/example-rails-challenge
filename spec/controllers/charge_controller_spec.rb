require 'rails_helper'

RSpec.describe ChargeController, type: :controller do
	describe "GET #index" do
    before :each do
      Customer.create(first_name: 'Johny', last_name: 'Flow')
      Customer.create(first_name: 'Raj', last_name: 'Jamnis')
      Customer.create(first_name: 'Andrew', last_name: 'Chung')
      Customer.create(first_name: 'Mike', last_name: 'Smith')

      # 10 Should be successful transactions
      Charge.create(paid: true, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 4000, currency: "usd", refunded: false, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 5000, currency: "usd", refunded: false, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 3000, currency: "cent", refunded: false, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 4000, currency: "usd", refunded: false, customer_id: Customer.second.id)
      Charge.create(paid: true, amount: 7000, currency: "cent", refunded: false, customer_id: Customer.second.id)
      Charge.create(paid: true, amount: 9000, currency: "usd", refunded: false, customer_id: Customer.second.id)
      Charge.create(paid: true, amount: 8000, currency: "usd", refunded: false, customer_id: Customer.third.id)
      Charge.create(paid: true, amount: 9000, currency: "cent", refunded: false, customer_id: Customer.fourth.id)

      # 5 Should be transactions that failed
      Charge.create(paid: false, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.third.id)
      Charge.create(paid: false, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.third.id)
      Charge.create(paid: false, amount: 5000, currency: "usd", refunded: false, customer_id: Customer.third.id)
      Charge.create(paid: false, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.fourth.id)
      Charge.create(paid: false, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.fourth.id)

      # 5 should be disputed transactions
      Charge.create(paid: true, amount: 3000, currency: "usd", refunded: true, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 4000, currency: "usd", refunded: true, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 5000, currency: "cent", refunded: true, customer_id: Customer.first.id)
      Charge.create(paid: true, amount: 3000, currency: "cent", refunded: true, customer_id: Customer.second.id)
      Charge.create(paid: true, amount: 4000, currency: "usd", refunded: true, customer_id: Customer.second.id)
    end

    it "returns 10 line items of Successful Charges" do
      get :index
      expect(assigns(:charges).where(paid:true, refunded: false).count).to eq(10)
    end

    it "returns 5 line items of Failed Charges" do
      get :index
      expect(assigns(:charges).where(paid:false).count).to eq(5)
    end

    it "returns 5 line items of Disputed Charges" do
      get :index
      expect(assigns(:charges).where(paid:true, refunded: true).count).to eq(5)
    end
  end
end
