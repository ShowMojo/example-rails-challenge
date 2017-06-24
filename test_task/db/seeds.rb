c1 = Customer.create( first_name: 'Johny', last_name: 'Flow')
c2 = Customer.create( first_name: 'Raj', last_name: 'Jamnis')
c3 = Customer.create( first_name: 'Andrew', last_name: 'Chung')
c4 = Customer.create( first_name: 'Mike', last_name: 'Smith')

# 10 Should be successful transactions:
  # 5 Should be linked to Customer 1
    5.times do |i|
      c1.charges.create(paid: true, amount: 4900 + i, currency: "usd", refunded: false)
    end
  # - 3 Should be linked to Customer 2
    3.times do |i|
      c2.charges.create(paid: true, amount: 4900 + i, currency: "usd", refunded: false)
    end
  # - 1 Should be linked to Customer 3
    c3.charges.create(paid: true, amount: 4900, currency: "usd", refunded: false)
  # - 1 Should be linked to Customer 4
    c4.charges.create(paid: true, amount: 4900, currency: "usd", refunded: false)

# 5 Should be transactions that failed:
  # - 3 Should be linked to Customer 3
    3.times do |i|
      c3.charges.create(paid: false, amount: 4900 + i, currency: "usd", refunded: false)
    end
  # - 2 Should be linked to Customer 4
    2.times do |i|
      c4.charges.create(paid: false, amount: 4900 + i, currency: "usd", refunded: false)
    end
# 5 should be disputed:
  # - 3 should be linked to Customer 1
    3.times do |i|
      c1.charges.create(paid: true, amount: 4900 + i, currency: "usd", refunded: true)
    end
  # - 2 should be linked to customer 2
    2.times do |i|
      c2.charges.create(paid: true, amount: 4900 + i, currency: "usd", refunded: true)
    end