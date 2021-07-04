# Generation 4 customers
customer_1 = Customer.where( first_name: 'Johny', last_name: 'Flow' ).first_or_create!
customer_2 = Customer.where( first_name: 'Raj', last_name: 'Jamnis' ).first_or_create!
customer_3 = Customer.where( first_name: 'Andrew', last_name: 'Chung' ).first_or_create!
customer_4 = Customer.where( first_name: 'Mike', last_name: 'Smith' ).first_or_create!


# Generation 10 successful transactions
5.times { Charge.create( paid: true, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_1 ) }
3.times { Charge.create( paid: true, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_2 ) }
Charge.create( paid: true, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_3 )
Charge.create( paid: true, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_4 )

# Generation 5 failed transactions
3.times { Charge.create( paid: false, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_3 ) }
2.times { Charge.create( paid: false, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_4 ) }

# Generation 5 disputed transactions
3.times { Charge.create( paid: true, refunded: true, amount: Random.rand(10000), currency: 'usd', created: Time.zone.now, customer: customer_1 ) }
2.times { Charge.create( paid: true, refunded: true, amount: Random.rand(10000), currency: 'usd',  created: Time.zone.now, customer: customer_2 ) }