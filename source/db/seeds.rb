# Creating Customers
customer1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

# 10 Should be successful transactions
5.times { customer1.credit_card_charges.create(paid: true, amount: rand(1000)) }
3.times { customer2.credit_card_charges.create(paid: true, amount: rand(1000)) }
customer3.credit_card_charges.create(paid: true, amount: rand(1000))
customer4.credit_card_charges.create(paid: true, amount: rand(1000))

# 5 Should be transactions that failed
3.times { customer3.credit_card_charges.create(paid: false, amount: rand(1000)) }
2.times { customer4.credit_card_charges.create(paid: false, amount: rand(1000)) }

# 5 should be disputed
3.times { customer1.credit_card_charges.create(paid: true, refunded: true, amount: rand(1000)) }
2.times { customer2.credit_card_charges.create(paid: true, refunded: true, amount: rand(1000)) }