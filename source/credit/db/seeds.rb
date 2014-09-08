# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create customers
cust1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
cust2 = Customer.create!(first_name: 'Raj', last_name: 'Jemnis')
cust3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
cust4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# 10 successful transactions:
5.times do 
  cust1.charges.create({
    paid: true,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: true
  })
end
3.times do 
  cust2.charges.create({
    paid: true,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: true
  })
end
cust3.charges.create({
  paid: true,
  created: Time.now,
  amount: rand(99999),
  currency: "usd",
  refunded: true
})
cust4.charges.create({
  paid: true,
  created: Time.now,
  amount: rand(99999),
  currency: "usd",
  refunded: true
})

#5 failed transaction
3.times do 
  cust3.charges.create({
    paid: false,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: false
  })
end
2.times do 
  cust4.charges.create({
    paid: false,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: false
  })
end

# 5 dispute transactions
3.times do 
  cust1.charges.create({
    paid: true,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: false
  })
end
2.times do 
  cust2.charges.create({
    paid: true,
    created: Time.now,
    amount: rand(99999),
    currency: "usd",
    refunded: false
  })
end