Charge.delete_all
Customer.delete_all

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

customers = [
							[1, "Johny", "Flow"],
						 	[2, "Raj", "Jamnis"], 
						 	[3, "Andrew", "Chung"], 
						 	[4, "Mike", "Smith"]
						 ]

customers.each do |id, firstName, lastName|
  	Customer.create!(id: id, firstname: firstName, lastname: lastName)
end


# For this exercise I assume:
# "successful" means paid=true refunded=false
# "failed" means paid=false refunded=false
# "disputed" means paid=true refunded=true

# SUCCESSFUL TRANSACTIONS

5.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 1)
end

3.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 2)
end

1.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 3)
end

1.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 4)
end


# FAILED TRANSACTIONS

3.times do
	Charge.create!(created: Time.now.to_i, 
										paid: false, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 3,
						   fail_date: rand_time(2.days.from_now))
end

2.times do
	Charge.create!(created: Time.now.to_i, 
										paid: false, 
								refunded: false, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 4,
						 	 fail_date: rand_time(2.days.from_now))
end


# DISPUTED TRANSACTIONS

3.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: true, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 1,
						dispute_date: rand_time(2.days.from_now))
end

2.times do
	Charge.create!(created: Time.now.to_i, 
										paid: true, 
								refunded: true, 
									amount: rand(1000..10000), 
								currency: "usd",
						 customer_id: 2,
						dispute_date: rand_time(2.days.from_now))
end