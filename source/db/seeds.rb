

# Create the customers
customers = Customer.create([{first_name: 'Johny', last_name: 'Flow'},
                             {first_name: 'Raj', last_name: 'Jamnis'},
                             {first_name: 'Andrew', last_name: 'Chung'},
                             {first_name: 'Mike', last_name: 'Smith'}
                            ])


# Add 10 successful transactions

# 5 transactions to Customer 1
Charge.create(amount: 20.40, paid: true, customer: customers[0])
Charge.create(amount: 15.35, paid: true, customer: customers[0])
Charge.create(amount: 85.50, paid: true, customer: customers[0])
Charge.create(amount: 209.00, paid: true, customer: customers[0])
Charge.create(amount: 28.20, paid: true, customer: customers[0])

# 3 transactions to Customer 2
Charge.create(amount: 150.20, paid: true, customer: customers[1])
Charge.create(amount: 80.50, paid: true, customer: customers[1])
Charge.create(amount: 20.00, paid: true, customer: customers[1])

# 1 transaction to Customer 3
Charge.create(amount: 14.65, paid: true, customer: customers[2])

# 1 transaction to Customer 4
Charge.create(amount: 440.20, paid: true, customer: customers[3])

# Add 5 failed transactions

# 3 transactions to Customer 3
Charge.create(amount: 30.20, customer: customers[2])
Charge.create(amount: 23.50, customer: customers[2])
Charge.create(amount: 250.00, customer: customers[2])

# 2 transactions to Customer 4
Charge.create(amount: 65.15, customer: customers[3])
Charge.create(amount: 157.20, customer: customers[3])

# Add 5 disputed transactions

# 3 transactions to Customer 1
Charge.create(amount: 80.50, paid: true, refunded: true, customer: customers[0])
Charge.create(amount: 120.20, paid: true, refunded: true, customer: customers[0])
Charge.create(amount: 45.00, paid: true, refunded: true, customer: customers[0])

# 2 transactions to Customer 2
Charge.create(amount: 84.20, paid: true, refunded: true, customer: customers[1])
Charge.create(amount: 50.55, paid: true, refunded: true, customer: customers[1])

