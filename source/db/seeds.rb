# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(:customer) do |c|
  FactoryBot.create_list(:charge, 5, :successful, customer: c)
  FactoryBot.create_list(:charge, 1, :disputed, customer: c)
end

FactoryBot.create(:customer, first_name: 'Raj', last_name: 'Jamnis') do |c|
  FactoryBot.create_list(:charge, 3, :successful, customer: c)
  FactoryBot.create_list(:charge, 2, :disputed, customer: c)
end

FactoryBot.create(:customer, first_name: 'Andrew', last_name: 'Chung') do |c|
  FactoryBot.create(:charge, :successful, customer: c)
  FactoryBot.create_list(:charge, 3, :failed, customer: c)
end

FactoryBot.create(:customer, first_name: 'Mike', last_name: 'Smith') do |c|
  FactoryBot.create(:charge, :successful, customer: c)
  FactoryBot.create_list(:charge, 2, :failed, customer: c)
end
