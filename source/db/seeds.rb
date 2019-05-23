##### Customers ######
Customer.destroy_all

p 'Generating customers...'

SEED_CUSTOMERS = [
 {
     first_name: 'Johny',
     last_name: 'Flow'
 }, {
     first_name: 'Raj',
     last_name: 'Jamnis'
 }, {
     first_name: 'Andrew',
     last_name: 'Chung'
 }, {
     first_name: 'Mike',
     last_name: 'Smith'
 },
]
4.times do |i|
    data = SEED_CUSTOMERS[i]
    customer = Customer.create(data)
    p "Generated #{customer.full_name}"
end

##### Transactions ######

# Successful transactions
5.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.first) }
3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.second) }
1.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.third) }
1.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.fourth) }

# Failed transactions
3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :failed, customer: Customer.third) }
2.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :failed, customer: Customer.fourth) }

# Disputed transactions
3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :disputed, customer: Customer.first) }
2.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :disputed, customer: Customer.second) }

