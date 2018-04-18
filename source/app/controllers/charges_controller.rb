class ChargesController < ApplicationController
  def index 
    @failed_charges = CreditCardCharge.failed
    @disputed_charges = CreditCardCharge.disputed
    @successful_charges = CreditCardCharge.successful
  end
end
