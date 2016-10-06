# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### Seed customers
customer_names = [
    %w(Johny Flow),
    %w(Raj Jamnis),
    %w(Andrew Chung),
    %w(Mike Smith)
]

customer_names.each do |full_name|
  Customer.create(first_name: full_name[0], last_name: full_name[1])
end

### Seed credit card charges

# successful
5.times { CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 1) }
3.times { CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 2) }
CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 3)
CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 4)

# failed
3.times { CreditCardCharge.create(paid: false, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 3) }
2.times { CreditCardCharge.create(paid: false, created:Time.now.to_i, refunded: false, amount: Random.rand(100..999), customer_id: 4) }

# disputed
3.times { CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: true, amount: Random.rand(100..999), customer_id: 1) }
2.times { CreditCardCharge.create(paid: true, created:Time.now.to_i, refunded: true, amount: Random.rand(100..999), customer_id: 2) }
