# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Seed 4 customers

@customer_1 = FactoryBot.create(:customer)
@customer_2 = FactoryBot.create(:customer)
@customer_3 = FactoryBot.create(:customer)
@customer_4 = FactoryBot.create(:customer)
