# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Seed 4 customers


@customer_1 = FactoryBot.create(:customer, first_name: 'Johny', last_name: 'Flow')
@customer_2 = FactoryBot.create(:customer, first_name: 'Raj', last_name: 'Jamnis')
@customer_3 = FactoryBot.create(:customer, first_name: 'Andrew', last_name: 'Chung')
@customer_4 = FactoryBot.create(:customer, first_name: 'Mike', last_name: 'Smith')


# seed 10 Successful transactions:
# successful means(paid: true, refunded: false)
# 5 successful transaction be linked to Customer 1
5.times{ FactoryBot.create(:charge, customer: @customer_1, paid: true, refunded: false) }

# 3 Should be linked to Customer 2
3.times{ FactoryBot.create(:charge, customer: @customer_2, paid: true, refunded: false) }

#   - 1 Should be linked to Customer 3
FactoryBot.create(:charge, customer: @customer_3, paid: true, refunded: false)

#   - 1 Should be linked to Customer 4
FactoryBot.create(:charge, customer: @customer_4, paid: true, refunded: false)


# seed 5 Failed transactions:
# faild means(paid: false)
# 3 Should be linked to Customer 3
3.times{ FactoryBot.create(:charge, customer: @customer_3, paid: false) }

# - 2 Should be linked to Customer 4
2.times{ FactoryBot.create(:charge, customer: @customer_4, paid: false) }


# 5 Disputed transactions:
# disputed means paid: true, refunded: true
# 3 should be linked to Customer 1
3.times{ FactoryBot.create(:charge, customer: @customer_1, paid: true, refunded: true) }

#   - 2 should be linked to customer 2
2.times{ FactoryBot.create(:charge, customer: @customer_2, paid: true, refunded: true) }
