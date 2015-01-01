# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

customers =
  [
    {first_name:'Johny', last_name: 'Flow'  },
    {first_name:'Raj',   last_name: 'Jamnis'  },
    {first_name:'Andrew',last_name: 'Chung'},
    {first_name:'Mike',  last_name: 'Smith'  }
  ]

customers.each do |customer|
  Customer.create(customer)
end

#failed transactions
5.times { Charge.create(paid: true,amount: rand(1...99),refunded: false,customer_id: 1 ) }
3.times { Charge.create(paid: true,amount: rand(1...99),refunded: false,customer_id: 2 ) }
Charge.create(paid: true,amount: rand(1...99),refunded: false,customer_id: 3 ) 
Charge.create(paid: true,amount: rand(1...99),refunded: false,customer_id: 4 )

#successful transactions
3.times { Charge.create(paid: false,amount: rand(1...99),refunded: false,customer_id: 3 ) }
2.times { Charge.create(paid: false,amount: rand(1...99),refunded: false,customer_id: 4 ) }

#disputed transactions
3.times { Charge.create(paid: true,amount: rand(1...99),refunded: true,customer_id: 1 ) }
2.times { Charge.create(paid: true,amount: rand(1...99),refunded: true,customer_id: 2 ) }
