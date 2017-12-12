# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customers = [ ["Johny", "Flow"],
              ["Raj", "Jamnis"],
              ["Andrew", "Chung"],
              ["Mike", "Smith"] ]

success_charges = { created: 10.years.ago.strftime("%Y%m%d"), paid: true, amount: 4900, currency: 'usd', refunded: false }
failed_charges = { created: 10.years.ago.strftime("%Y%m%d"), paid: false, amount: 4900, currency: 'usd', refunded: true }
disputed_charges = { created: 10.years.ago.strftime("%Y%m%d"), paid: true, amount: 4900, currency: 'usd', refunded: true }

customers.each.with_index do |customer, index|

  created_customer = Customer.create({first_name: customer[0], last_name: customer[1]})

  case index
  when 0
    5.times do
      created_customer.charges.create(success_charges)
    end

    3.times do
      created_customer.charges.create(disputed_charges)
    end
  when 1
    3.times do
      created_customer.charges.create(success_charges)
    end

    2.times do
      created_customer.charges.create(disputed_charges)
    end
  when 2
    1.times do
      created_customer.charges.create(success_charges)
    end

    3.times do
      created_customer.charges.create(failed_charges)
    end
  when 3
    1.times do
      created_customer.charges.create(success_charges)
    end

    2.times do
      created_customer.charges.create(failed_charges)
    end
  end
end
