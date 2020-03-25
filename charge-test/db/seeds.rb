def create_charge(customer = nil, paid = nil, refunded = nil)
  CreditCardCharge.create(created: Time.now.to_i, paid: paid,
                          amount: rand(10_000), currency: 'usd',
                          refunded: refunded, customer: customer)
end

customer1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create(first_name: 'Raj', last_name: 'Flow')
customer3 = Customer.create(first_name: 'Andrew', last_name: 'Flow')
customer4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

#successful
5.times { create_charge(customer1, true, false) }
3.times { create_charge(customer2, true, false) }
1.times { create_charge(customer3, true, false) }
1.times { create_charge(customer4, true, false) }

#failed
3.times { create_charge(customer3, false, false) }
2.times { create_charge(customer4, false, false) }

#disputed
3.times { create_charge(customer1, true, true) }
2.times { create_charge(customer2, true, true) }