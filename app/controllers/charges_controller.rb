class ChargesController < ApplicationController

	def index
		@successfull_charges = Charge.successfull
		@failed_charges = Charge.failed
		@disputed_charges = Charge.disputed
	end

end
