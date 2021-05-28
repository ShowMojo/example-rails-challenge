# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# insert 4 customer records in database

first_names = ['Johny', 'Raj', 'Andrew', 'Mike']
last_names = ['Flow','Jamnis','Chung','Smith']

puts "#"*80
puts "Inserting customers..."
puts "#"*80


for i in 0...4 do 
  Customer.create!(first_name: first_names[i], last_name: last_names[i])
end


# insert 20 transactions (charges) in to the database

puts "#"*80
puts "Inserting charges..."
puts "#"*80

customers = Customer.first(4)

customer_1 = customers[0]
customer_2 = customers[1]
customer_3 = customers[2]
customer_4 = customers[3]

# successful transactions
5.times do
  customer_1.charges.create!({ paid: true, amount: 67883, currency: "USD", refunded: true}.merge({status: :successful}))
end

3.times do
  customer_2.charges.create!({ paid: false, amount: 45342, currency: "USD", refunded: true}.merge({status: :successful}))
end

customer_3.charges.create!({ paid: true, amount: 32343, currency: "USD", refunded: true}.merge({status: :successful}))

customer_4.charges.create!({ paid: true, amount: 67883, currency: "USD", refunded: true}.merge({status: :successful}))

# Failed transactions
3.times do
  customer_3.charges.create!({ paid: true, amount: 56444, currency: "USD", refunded: true}.merge({status: :failed}))
end

2.times do
  customer_4.charges.create!({ paid: true, amount: 923231, currency: "USD", refunded: true}.merge({status: :failed}))
end

# Disputed transactions
3.times do
  customer_1.charges.create!({ paid: true, amount: 4353453, currency: "USD", refunded: true}.merge({status: :disputed}))
end

2.times do
  customer_2.charges.create!({ paid: true, amount: 2342342, currency: "USD", refunded: true}.merge({status: :disputed}))
end
