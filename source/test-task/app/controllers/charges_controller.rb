class ChargesController < ApplicationController

  def index
    @failed_charges = Charge.includes(:customer).failed
    @disputed_charges = Charge.includes(:customer).disputed
    @successful_charges = Charge.includes(:customer).successful
  end

end