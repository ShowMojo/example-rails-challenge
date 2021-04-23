# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed 4 Customers into the system:
customer_names = ['Johny Flow', 'Raj Jamnis', 'Andrew Chung', 'Mike Smith']
customer_names.each do |name|
  first_name, last_name = name.split(' ')
  Customer.create(first_name: first_name, last_name: last_name)
  puts "Customer created with name #{name}"
end

# Seed 20 transactions (charges) into the system:
# 10 Should be successful transactions:
successful_transaction_params = {
  "created": Time.now.to_i,
  "paid": true,
  "amount": rand(100..99999),
  "currency": "usd",
  "refunded": false
}

5.times { Customer.first.transactions.create(successful_transaction_params) }
puts "5 successful transactions linked to Customer 1"
3.times { Customer.second.transactions.create(successful_transaction_params) }
puts "3 successful transactions linked to Customer 2"
Customer.third.transactions.create(successful_transaction_params)
puts "1 successful transactions linked to Customer 3"
Customer.fourth.transactions.create(successful_transaction_params)
puts "1 successful transactions linked to Customer 4"

# 5 Should be transactions that failed:
failed_transaction_params = {
  "created": Time.now.to_i,
  "paid": false,
  "amount": rand(100..99999),
  "currency": "usd",
  "refunded": false
}

3.times { Customer.third.transactions.create(failed_transaction_params) }
puts "3 failed transactions linked to Customer 3"
2.times { Customer.fourth.transactions.create(failed_transaction_params) }
puts "2 failed transactions linked to Customer 4"

# 5 should be disputed:
disputed_transaction_params = {
  "created": Time.now.to_i,
  "paid": true,
  "amount": rand(100..99999),
  "currency": "usd",
  "refunded": true
}

3.times { Customer.first.transactions.create(disputed_transaction_params) }
puts "3 successful transactions linked to Customer 1"
2.times { Customer.second.transactions.create(disputed_transaction_params) }
puts "2 successful transactions linked to Customer 2"
