# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# By Gabriel Kozak

# Customer model
Customer.delete_all		# Initialization

# Creating sample customers
Customer.create(first_name: "Johny", last_name: "Flow")
Customer.create(first_name: "Raj", last_name: "Jamnis")
Customer.create(first_name: "Andrew", last_name: "Chung")
Customer.create(first_name: "Mike", last_name: "Smith")

# Charge model
Charge.delete_all		# Initialization

customers = Customer.all

# Creating successful charges
10.times do |i|
	charge = Charge.new(created: rand(5.years).ago.to_i, paid: true, amount: rand(1..5000), refunded: false, currency: "usd")
	if i < 5
		charge.customer = customers[0]
	elsif i < 8
		charge.customer = customers[1]
	elsif i < 9
		charge.customer = customers[2]
	else
		charge.customer = customers[3]
	end

	if charge.valid?
		charge.save
	end
end

# Creating failed charges
5.times do |i|
	charge = Charge.new(created: rand(5.years).ago.to_i, paid: false, amount: rand(1..5000), refunded: false, currency: "usd")
	if i < 3
		charge.customer = customers[2]
	else
		charge.customer = customers[3]
	end

	if charge.valid?
		charge.save
	end
end

# Creating disputed charges
5.times do |i|
	charge = Charge.new(created: rand(5.years).ago.to_i, paid: true, amount: rand(1..5000), refunded: true, currency: "usd")
	if i < 3
		charge.customer = customers[0]
	else
		charge.customer = customers[1]
	end

	if charge.valid?
		charge.save
	end
end
# End of gabriel's code.