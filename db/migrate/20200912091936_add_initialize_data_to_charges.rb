class AddInitializeDataToCharges < ActiveRecord::Migration
  def change
  	5.times do
  		Charge.create(
  			paid: true,
  			amount: 500,
  			currency: 'usd',
  			refunded: false,
  			customer: Customer.first
  		)
  	end

  	3.times do
  		Charge.create(
  			paid: true,
  			amount: 500,
  			currency: 'usd',
  			refunded: false,
  			customer: Customer.second
  		)
  	end

		Charge.create(
			paid: true,
			amount: 500,
			currency: 'usd',
			refunded: false,
			customer: Customer.third
		)

		Charge.create(
			paid: true,
			amount: 500,
			currency: 'usd',
			refunded: false,
			customer: Customer.last
		)

		3.times do
  		Charge.create(
  			paid: false,
  			amount: 500,
  			currency: 'usd',
  			refunded: false,
  			customer: Customer.third
  		)
  	end

  	2.times do
  		Charge.create(
  			paid: false,
  			amount: 500,
  			currency: 'usd',
  			refunded: false,
  			customer: Customer.last
  		)
  	end

  	3.times do
  		Charge.create(
  			paid: true,
  			amount: 500,
  			currency: 'usd',
  			refunded: true,
  			customer: Customer.first
  		)
  	end

  	2.times do
  		Charge.create(
  			paid: true,
  			amount: 500,
  			currency: 'usd',
  			refunded: true,
  			customer: Customer.second
  		)
  	end
  end
end
