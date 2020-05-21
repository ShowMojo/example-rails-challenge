p 'Create users...'
customer1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

def create_successful_transaction(customer_id)
  create_transaction(customer_id)
end

def create_failed_transaction(customer_id)
  create_transaction(customer_id, true)
end

def create_disputed_transaction(customer_id)
  create_transaction(customer_id, false, true)
end

def create_transaction(customer_id, failed = false, disputed = false)
  Charge.create(
    paid: !failed,
    amount: (200..6000).to_a.sample, # pick random amount
    currency: 'usd',
    refunded: disputed,
    customer_id: customer_id
  )
end

p 'Create successful transactions...'
5.times do |t|
  create_successful_transaction(customer1.id)
end
3.times do |t|
  create_successful_transaction(customer2.id)
end
create_successful_transaction(customer3.id)
create_successful_transaction(customer4.id)

p 'Create failed transactions...'
3.times do |t|
  create_failed_transaction(customer3.id)
end
2.times do |t|
  create_failed_transaction(customer4.id)
end

p 'Create disputed transactions...'
3.times do |t|
  create_disputed_transaction(customer1.id)
end
2.times do |t|
  create_disputed_transaction(customer2.id)
end
