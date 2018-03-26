# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
customer_1 = Customer.create(first_name: 'Johny' , last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj' , last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew' , last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Make' , last_name: 'Smith')

# customer 1
for i in 1..8
  if (i <= 5)
    paid = true
    refunded = false
  else
    paid = false
    refunded = true
  end
  customer_1.card_charges.create(created: Time.now.getutc, paid: paid,
                                 amount: Faker::Number.decimal(3),
                                 currency: 'usd', refunded: refunded)
end

# customer 2
for i in 1..5
  if (i <= 3)
    paid = true
    refunded = false
  else
    paid = false
    refunded = true
  end
  customer_2.card_charges.create(created: Time.now.getutc, paid: paid,
                                 amount: Faker::Number.decimal(3),
                                 currency: 'usd', refunded: refunded)
end

# customer 3
for i in 1..4
  if (i <= 1)
    paid = true
    refunded = false
  else
    paid = false
    refunded = false
  end
  customer_3.card_charges.create(created: Time.now.getutc, paid: paid,
                                 amount: Faker::Number.decimal(3),
                                 currency: 'usd', refunded: refunded)
end

# customer 4
for i in 1..3
  if (i <= 1)
    paid = true
    refunded = false
  else
    paid = false
    refunded = false
  end
  customer_4.card_charges.create(created: Time.now.getutc, paid: paid,
                                 amount: Faker::Number.decimal(3),
                                 currency: 'usd', refunded: refunded)
end
