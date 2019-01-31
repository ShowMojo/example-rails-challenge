# Customers

Customer.create(id: 1, first_name: 'Johny', last_name: 'Flow')
Customer.create(id: 2, first_name: 'Raj', last_name: 'Jamnis')
Customer.create(id: 3, first_name: 'Andrew', last_name: 'Chung')
Customer.create(id: 4, first_name: 'Mike', last_name: 'Smith')

# Charges
def create_random_charge(charge_scope, number, customer_id)
  number.times do
    Charge.send(charge_scope).create(
      created: Time.at(rand(Time.now.to_f)),
      customer_id: customer_id,
      amount: rand(100..50000),
      currency: 'usd',
    )
  end
end

# Successful Charges
create_random_charge(:successful, 5, 1)
create_random_charge(:successful, 3, 2)
create_random_charge(:successful, 1, 3)
create_random_charge(:successful, 1, 4)

# Failed Charges
create_random_charge(:failed, 3, 3)
create_random_charge(:failed, 2, 4)

# Disputed Charges
create_random_charge(:disputed, 3, 1)
create_random_charge(:disputed, 2, 2)
