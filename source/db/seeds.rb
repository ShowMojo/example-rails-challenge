def build_charge_defaults( options = {} )
	return Charge.create( {
			created: DateTime.now - rand(30).days,
			paid: true,
			amount: rand(3000)*100,
			currency: "usd",
			refunded: false,
			customer: nil
		}.merge( options )
	)
end

Charge.destroy_all
Customer.destroy_all

customer1 = Customer.create( firstname: "Johny", lastname: "Flow" )
customer2 = Customer.create( firstname: "Raj", lastname: "Jamnis" )
customer3 = Customer.create( firstname: "Andrew", lastname: "Chung" )
customer4 = Customer.create( firstname: "Mike", lastname: "Smith" )


# SUCCESSFULL ( paid: true )
5.times do 
	c = build_charge_defaults({ customer: customer1 })
end
3.times do 
	c = build_charge_defaults({ customer: customer2 })
end
c = build_charge_defaults({ customer: customer3 })
c = build_charge_defaults({ customer: customer4 })

# FAILED ( paid: false )
3.times do 
	c = build_charge_defaults({ customer: customer3, paid: false })
end
2.times do 
	c = build_charge_defaults({ customer: customer4, paid: false })
end

# DIPUTED ( paid: true, refunded: true )
3.times do 
	c = build_charge_defaults({ customer: customer1, paid: true, refunded: true })
end
2.times do 
	c = build_charge_defaults({ customer: customer2, paid: true, refunded: true })
end