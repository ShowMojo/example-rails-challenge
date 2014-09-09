class ChargesController < ApplicationController

  def index
    charge_with_customer = Charge.includes(:customer)
    @failed_charges = charge_with_customer.failed
    @disputed_charges = charge_with_customer.disputed
    @successful_charges = charge_with_customer.successful
  end

end
