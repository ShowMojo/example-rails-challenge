
customer_1 = Customer.find_or_create_by(fname: 'Johny', lname: 'Flow')
customer_2 = Customer.find_or_create_by(fname: 'Raj', lname: 'Jamnis')
customer_3 = Customer.find_or_create_by(fname: 'Andrew', lname: 'Chung')
customer_4 = Customer.find_or_create_by(fname: 'Mike', lname: 'Smith')

5.times {Charge.create(paid: true, refunded: false, amount: rand(0..10000), customer: customer_1)}
3.times {Charge.create(paid: true, refunded: false, amount: rand(0..10000), customer: customer_2)}
1.times {Charge.create(paid: true, refunded: false, amount: rand(0..10000), customer: customer_3)}
1.times {Charge.create(paid: true, refunded: false, amount: rand(0..10000), customer: customer_4)}

3.times {Charge.create(paid: false, refunded: false, amount: rand(0..10000), customer: customer_3)}
2.times {Charge.create(paid: false, refunded: false, amount: rand(0..10000), customer: customer_4)}

3.times {Charge.create(paid: true, refunded: true, amount: rand(0..10000), customer: customer_1)}
2.times {Charge.create(paid: true, refunded: true, amount: rand(0..10000), customer: customer_2)}