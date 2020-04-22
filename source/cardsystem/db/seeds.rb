# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = Customer.create(
  [
    {

      first_name: 'Johny',
      last_name: 'Flow'
    },
    {

      first_name: 'Raj',
      last_name: 'Jamnis'
    },
    {
      first_name: 'Andrew',
      last_name: 'Chung'
    },
    {
      first_name: 'Mike',
      last_name: 'Smith'
    }
  ]
)

5.times { Charge.create(customer: customers[0], paid: true, currency: 'usd', amount: 1, refunded: false) }
3.times { Charge.create(customer: customers[1], paid: true, currency: 'usd', amount: 1, refunded: false) }
1.times { Charge.create(customer: customers[2], paid: true, currency: 'usd', amount: 1, refunded: false) }
1.times { Charge.create(customer: customers[3], paid: true, currency: 'usd', amount: 1, refunded: false) }

3.times { Charge.create(customer: customers[2], paid: false, currency: 'usd', amount: 1, refunded: false) }
2.times { Charge.create(customer: customers[3], paid: false, currency: 'usd', amount: 1, refunded: false) }

3.times { Charge.create(customer: customers[0], paid: true, currency: 'usd', amount: 1, refunded: true) }
2.times { Charge.create(customer: customers[1], paid: true, currency: 'usd', amount: 1, refunded: true) }
