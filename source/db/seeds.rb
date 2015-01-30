# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Customer.create({first_name: 'Johny', last_name: 'Flow'})
Customer.create({first_name: 'Raj', last_name: 'Jamnis'})
Customer.create({first_name: 'Andrew', last_name: 'Chung'})
Customer.create({first_name: 'Mike', last_name: 'Smith'})

# Successful transactions
5.times do
  Transaction.create({paid: true, amount: 50, currency: 'USD', refunded: false, customer_id: 1, disputed: false})
end

3.times do
  Transaction.create({paid: true, amount: 11.99, currency: 'USD', refunded: false, customer_id: 2, disputed: false})
end

Transaction.create({paid: true, amount: 45, currency: 'USD', refunded: false, customer_id: 3, disputed: false})
Transaction.create({paid: true, amount: 69, currency: 'USD', refunded: false, customer_id: 4, disputed: false})

# Failed transactions
3.times do
  Transaction.create({paid: false, amount: 50, currency: 'USD', refunded: false, customer_id: 3, disputed: false})
end

2.times do
  Transaction.create({paid: false, amount: 56.89, currency: 'USD', refunded: false, customer_id: 4, disputed: false})
end

# Disputed transactions
3.times do
  Transaction.create({paid: true, amount: 50, currency: 'USD', refunded: false, customer_id: 1, disputed: true})
end

2.times do
  Transaction.create({paid: true, amount: 56.89, currency: 'USD', refunded: false, customer_id: 2, disputed: true})
end





