# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Charge.delete_all
Customer.delete_all

customer1 = Customer.create!(
    first_name: 'Johny',
    last_name: 'Flow'
)

customer2 = Customer.create!(
    first_name: 'Raj',
    last_name: 'Jamnis'
)

customer3 = Customer.create!(
    first_name: 'Andrew',
    last_name: 'Chung'
)

customer4 = Customer.create!(
    first_name: 'Mike',
    last_name: 'Smith'
)

Charge.create([
    {
        paid: true,
        amount: 100,
        currency: 'usd',
        refunded: false,
        customer: customer1
    },{
        paid: true,
        amount: 200,
        currency: 'usd',
        refunded: false,
        customer: customer1
    },{
        paid: true,
        amount: 300,
        currency: 'usd',
        refunded: false,
        customer: customer1
    },{
        paid: true,
        amount: 400,
        currency: 'usd',
        refunded: false,
        customer: customer1
    },{
        paid: true,
        amount: 500,
        currency: 'usd',
        refunded: false,
        customer: customer1
    },{
        paid: true,
        amount: 600,
        currency: 'usd',
        refunded: false,
        customer: customer2 
    },{
        paid: true,
        amount: 700,
        currency: 'usd',
        refunded: false,
        customer: customer2
    },{
        paid: true,
        amount: 800,
        currency: 'usd',
        refunded: false,
        customer: customer2
    },{
        paid: true,
        amount: 900,
        currency: 'usd',
        refunded: false,
        customer: customer3
    },{
        paid: true,
        amount: 1000,
        currency: 'usd',
        refunded: false,
        customer: customer4
    },{
        paid: false,
        amount: 1100,
        currency: 'usd',
        refunded: false,
        customer: customer3
    },{
        paid: false,
        amount: 1200,
        currency: 'usd',
        refunded: false,
        customer: customer3
    },{
        paid: false,
        amount: 1300,
        currency: 'usd',
        refunded: false,
        customer: customer3
    },{
        paid: false,
        amount: 1400,
        currency: 'usd',
        refunded: false,
        customer: customer4
    },{
        paid: false,
        amount: 1500,
        currency: 'usd',
        refunded: false,
        customer: customer4
    },{
        paid: false,
        amount: 1600,
        currency: 'usd',
        refunded: true,
        customer: customer1
    },{
        paid: false,
        amount: 1700,
        currency: 'usd',
        refunded: true,
        customer: customer1
    },{
        paid: false,
        amount: 1800,
        currency: 'usd',
        refunded: true,
        customer: customer1
    },{
        paid: false,
        amount: 1900,
        currency: 'usd',
        refunded: true,
        customer: customer2
    },{
        paid: false,
        amount: 2000,
        currency: 'usd',
        refunded: true,
        customer: customer2
    }
])