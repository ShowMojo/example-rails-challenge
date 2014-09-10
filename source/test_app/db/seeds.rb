customers = [ { first_name: "Johny", last_name: "Flow" },
							{ first_name: "Raj", last_name: "Jamnis" },
							{ first_name: "Andrew", last_name: "Chung" },
							{ first_name: "Mike", last_name: "Smith" },
						]

customers.each{ |customer| Customer.create!(customer) }

charges = [ { customer: 1, no_of_records: 5, status: 0 },
					  { customer: 2, no_of_records: 3, status: 0 },
						{ customer: 3, no_of_records: 1, status: 0 },
						{ customer: 4, no_of_records: 1, status: 0 },
						{ customer: 3, no_of_records: 3, status: 1 },
						{ customer: 4, no_of_records: 2, status: 1 },
						{ customer: 1, no_of_records: 3, status: 2 },
						{ customer: 2, no_of_records: 2, status: 2 }
					]

charges.each do |charge|
	charge[:no_of_records].times do |time|
		Charge.create!(paid: true, amount: Random.rand(10000), currency: "usd", refunded: false, customer_id: charge[:customer], status: charge[:status])
	end
end