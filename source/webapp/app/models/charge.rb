class Charge < ActiveRecord::Base
	belongs_to :customer

	def display_amount
		amount/100
	end

	def display_currency
		currency.upcase + " "
	end
end
