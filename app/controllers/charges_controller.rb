class ChargesController < ApplicationController
	def index
    @successful_charges = Charge.successful
    @failed_charges = Charge.failed.includes(:customer)
    @disputed_charges = Charge.disputed.includes(:customer)
  end
end
