# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = [
  {first_name: "Johny", last_name: "Flow", successful: 5, failed: 0, disputed: 3},
  {first_name: "Raj", last_name: "Jamnis", successful: 3, failed: 0, disputed: 2},
  {first_name: "Andrew", last_name: "Chung", successful: 1, failed: 3, disputed: 0},
  {first_name: "Mike", last_name: "Smith", successful: 1, failed: 2, disputed: 0}
]

customers.each do |c|
  customer = Customer.find_or_create_by(first_name: c[:first_name], last_name: c[:last_name])

  (1..c[:successful]).each do |x|
    Charge.create_charge(customer.id)
  end  

  (1..c[:failed]).each do |x|
    Charge.create_charge(customer.id, false)
  end 

  (1..c[:disputed]).each do |x|
    Charge.create_charge(customer.id, true, true)
  end 
end  

  