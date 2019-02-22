class ChargesController < ApplicationController
  def index
    @successful_charges = CreditCardCharge.successful
    @failed_charges = CreditCardCharge.failed
    @disputed_charges = CreditCardCharge.disputed
  end
end
