class ChargesController < ApplicationController

  def index
    charges = Charge.includes(:customer)

    @failed_charges     = charges.failed
    @disputed_charges   = charges.disputed
    @successful_charges = charges.successful
  end
end
