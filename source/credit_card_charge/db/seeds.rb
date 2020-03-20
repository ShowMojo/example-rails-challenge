johny  = Customer.create(first_name: 'Johny',  last_name: 'Flow')
raj    = Customer.create(first_name: 'Raj',    last_name: 'Jamnis')
andrew = Customer.create(first_name: 'Andrew', last_name: 'Chung')
mike   = Customer.create(first_name: 'Mike',   last_name: 'Smith')

#successful transactions

1.upto(5).each do |i|
  johny.charges.create(amount: rand(10000), paid: true)
end

1.upto(3).each do |i|
  raj.charges.create(amount: rand(10000),  paid: true)
end

andrew.charges.create(amount: rand(10000), paid: true)

mike.charges.create(amount: rand(10000),   paid: true)


#failed transactions
1.upto(3).each do |i|
  andrew.charges.create(amount: rand(10000), paid: false)
end

1.upto(2).each do |i|
  mike.charges.create(amount: rand(10000),   paid: false)
end

#disputed transactions

1.upto(3).each do |i|
  johny.charges.create(amount: rand(10000), paid: true, refunded: true)
end

1.upto(2).each do |i|
  raj.charges.create(amount: rand(10000),   paid: true, refunded: true)
end

