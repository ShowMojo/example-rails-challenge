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

