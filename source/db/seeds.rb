
# -- Customer 1
c1 = Customer.create(first_name: 'Johny', last_name: 'Flow')

  # -- Successful transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: false}.to_json
  5.times do
    c1.charges.create(JSON.parse(charge))
  end

  # -- Failed transactions
    # -- No transactions

  # -- Disputed transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: true}.to_json
  3.times do
    c1.charges.create(JSON.parse(charge))
  end

# ###################################################

# -- Customer 2
c2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')

  # -- Successful transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: false}.to_json
  3.times do
    c2.charges.create(JSON.parse(charge))
  end

  # -- Failed transactions
    # -- No transactions

  # -- Disputed transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: true}.to_json
  2.times do
    c2.charges.create(JSON.parse(charge))
  end

# ###################################################

# -- Customer 3
c3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')

  # -- Successful transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: false}.to_json
  1.times do
    c3.charges.create(JSON.parse(charge))
  end

  # -- Failed transactions
  charge = {created: 12345678, paid: false, amount: 45837, currency: 'usd', refunded: false}.to_json
  3.times do
    c3.charges.create(JSON.parse(charge))
  end

  # -- Disputed transactions
    # -- No transactions

# ###################################################

# -- Customer 4
c4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

  # -- Successful transactions
  charge = {created: 12345678, paid: true, amount: 45837, currency: 'usd', refunded: false}.to_json
  1.times do
    c4.charges.create(JSON.parse(charge))
  end

  # -- Failed transactions
  charge = {created: 12345678, paid: false, amount: 45837, currency: 'usd', refunded: false}.to_json
  2.times do
    c4.charges.create(JSON.parse(charge))
  end

  # -- Disputed transactions
    # -- No transactions
