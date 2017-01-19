# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = [
    {first_name: 'Johny', last_name: 'Flow'},
    {first_name: 'Raj', last_name: 'Jamnis'},
    {first_name: 'Andrew', last_name: 'Chung'},
    {first_name: 'Mike', last_name: 'Smith'}
]

Customer.all.destroy_all
customers.each_with_index do |c, i|
  customer = Customer.create(c)
  case i
    when 0
      FactoryGirl.create_list(:charge, 5, :succeed, customer: customer)
      FactoryGirl.create_list(:charge, 3, :disputed, customer: customer)
    when 1
      FactoryGirl.create_list(:charge, 3, :succeed, customer: customer)
      FactoryGirl.create_list(:charge, 2, :disputed, customer: customer)
    when 2
      FactoryGirl.create(:charge, :succeed, customer: customer)
      FactoryGirl.create_list(:charge, 3, :failed, customer: customer)
    when 3
      FactoryGirl.create(:charge, :succeed, customer: customer)
      FactoryGirl.create_list(:charge, 2, :failed, customer: customer)
  end
end