# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer1 = FactoryBot.create(:customer, first_name: 'Johny', last_name: 'Flow')
customer2 = FactoryBot.create(:customer, first_name: 'Raj', last_name: 'Jamnis')
customer3 = FactoryBot.create(:customer, first_name: 'Andrew', last_name: 'Chung')
customer4 = FactoryBot.create(:customer, first_name: 'Mike', last_name: 'Smith')

# Successful credit_card_charges
5.times { FactoryBot.create(:successful, customer: customer1) }
3.times { FactoryBot.create(:successful, customer: customer2) }
FactoryBot.create(:successful, customer: customer3)
FactoryBot.create(:successful, customer: customer4)

# failed credit_card_charges
3.times { FactoryBot.create(:failed, customer: customer3)}
2.times { FactoryBot.create(:failed, customer: customer4)}

# disputed credit_card_charges
3.times { FactoryBot.create(:disputed, customer: customer1)}
2.times { FactoryBot.create(:disputed, customer: customer2)}