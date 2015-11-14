# Customers
customer1 = Customer.create(first_name: "Johny", last_name: "Flow")
customer2 = Customer.create(first_name: "Raj", last_name: "Jamnis")
customer3 = Customer.create(first_name: "Andrew", last_name: "Chung")
customer4 = Customer.create(first_name: "Mike", last_name: "Smith")

# Successful transactions
5.times { Charge.create(customer: customer1, amount: rand(10_000..100_0000), currency: "USD", status: :success) }
3.times { Charge.create(customer: customer2, amount: rand(10_000..100_0000), currency: "USD", status: :success) }
Charge.create(customer: customer3, amount: rand(10_000..100_0000), currency: "USD", status: :success)
Charge.create(customer: customer4, amount: rand(10_000..100_0000), currency: "USD", status: :success)

# Failed transactions
3.times { Charge.create(customer: customer3, amount: rand(10_000..100_0000), currency: "USD", status: :failed) }
2.times { Charge.create(customer: customer4, amount: rand(10_000..100_0000), currency: "USD", status: :failed) }

# Disputed transactions
3.times { Charge.create(customer: customer1, amount: rand(10_000..100_0000), currency: "USD", status: :disputed) }
2.times { Charge.create(customer: customer2, amount: rand(10_000..100_0000), currency: "USD", status: :disputed) }
