# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customers = Customer.create([
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
    },
])

10.times do |index|
    if index < 5
        customer = customers[0].id
    elsif index >= 5 && index < 8
        customer = customers[1].id
    elsif index == 8
        customer = customers[2].id
    elsif index == 9
        customer = customers[3].id
    end

    Charge.create(
        created: Time.now.to_i,
        paid: true, 
        amount: rand(5000..10000),
        currency: 'usd',
        refunded: false,
        status: 'succeed',
        customer_id: customer
    )
end

5.times do |index|
    if index < 3
        customer = customers[2].id
    elsif index >= 3
        customer = customers[3].id
    end

    Charge.create(
        created: Time.now.to_i,
        paid: true, 
        amount: rand(5000..10000),
        currency: 'usd',
        refunded: false,
        status: 'failed',
        customer_id: customer
    )
end

5.times do |index|
    if index < 3
        customer = customers[0].id
    elsif index >= 3
        customer = customers[1].id
    end

    Charge.create(
        created: Time.now.to_i,
        paid: true, 
        amount: rand(5000..10000),
        currency: 'usd',
        refunded: false,
        status: 'disputed',
        customer_id: customer
    )
end
