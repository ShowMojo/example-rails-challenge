customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

# Seed 20 transactions (charges) into the system:
# 10 Should be successful transactions:
# - 5 Should be linked to Customer 1
# - 3 Should be linked to Customer 2
# - 1 Should be linked to Customer 3
# - 1 Should be linked to Customer 4
5.times { customer_1.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: false) }
3.times { customer_2.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: false) }
customer_3.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: false)
customer_4.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: false)

# 5 Should be transactions that failed:
# - 3 Should be linked to Customer 3
# - 2 Should be linked to Customer 4
3.times { customer_3.charges.create(paid: false, amount: rand(100), currency: 'usd', refunded: false) }
2.times { customer_4.charges.create(paid: false, amount: rand(100), currency: 'usd', refunded: false) }

# 5 should be disputed:
# - 3 should be linked to Customer 1
# - 2 should be linked to customer 2
3.times { customer_1.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: true) }
2.times { customer_2.charges.create(paid: true, amount: rand(100), currency: 'usd', refunded: true) }
