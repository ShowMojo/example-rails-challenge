class Charge < ActiveRecord::Base

	belongs_to :customer

	# Failed charges
	def self.list1
		Charge.where(paid: 0)
	end

	# Disputed charges
	def self.list2
		Charge.where(paid: 1, refunded: 1)
	end

	# Successful charges
	def self.list3
		Charge.where(paid: 1, refunded: 0)
	end

end
