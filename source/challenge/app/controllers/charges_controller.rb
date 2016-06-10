class ChargesController < ApplicationController

	def index
		@failed_charges = Charge.failed
		@disputed_charges = Charge.disputed
		@successful_charges = Charge.successful
	end

end