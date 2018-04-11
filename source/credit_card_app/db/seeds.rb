# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

transaction_template = -> {{
    created: Random.new.rand(Time.now.to_i),
    amount: Random.new.rand(100000),
    currency: 'usd'
}}

successful = { paid: true, refunded: false }
failed = { paid: false, refunded: false }
disputed = { paid: true, refunded: true }

5.times do
  customer_1.card_transactions.create(transaction_template.call.merge(successful))
end

3.times do
  customer_2.card_transactions.create(transaction_template.call.merge(successful))
end

customer_3.card_transactions.create(transaction_template.call.merge(successful))
customer_4.card_transactions.create(transaction_template.call.merge(successful))

3.times do
  customer_3.card_transactions.create(transaction_template.call.merge(failed))
  customer_1.card_transactions.create(transaction_template.call.merge(disputed))
end

2.times do
  customer_4.card_transactions.create(transaction_template.call.merge(failed))
  customer_2.card_transactions.create(transaction_template.call.merge(disputed))
end
