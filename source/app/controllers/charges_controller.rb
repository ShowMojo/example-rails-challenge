class ChargesController < ApplicationController
  def index
    @successful_charges = Charge.includes(:customer).successful
    @failed_charges     = Charge.includes(:customer).failed
    @disputed_charges   = Charge.includes(:customer).disputed
  end
end
