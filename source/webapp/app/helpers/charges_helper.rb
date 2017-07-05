module ChargesHelper
	def successful_charges
		@charges.find_all {|c| c.paid == true && c.refunded == false }
	end

	def disputed_charges
		@charges.find_all {|c| c.paid == true && c.refunded == true }
	end

	def failed_charges
		@charges.find_all {|c| c.paid == false && c.refunded == false }
	end
end
