# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create(:customer, first_name: "Johny", last_name: "Flow")
FactoryGirl.create(:customer, first_name: "Raj", last_name: "Jamnis")
FactoryGirl.create(:customer, first_name: "Andrew", last_name: "Chung")
FactoryGirl.create(:customer, first_name: "Mike", last_name: "Smith")

5.times { FactoryGirl.create(:successfull, customer_id: 1) }
3.times { FactoryGirl.create(:successfull, customer_id: 2) }
FactoryGirl.create(:successfull, customer_id: 3)
FactoryGirl.create(:successfull, customer_id: 4)

3.times { FactoryGirl.create(:failed, customer_id: 3) }
2.times { FactoryGirl.create(:failed, customer_id: 4) }

3.times { FactoryGirl.create(:disputed, customer_id: 1) }
2.times { FactoryGirl.create(:disputed, customer_id: 2) }