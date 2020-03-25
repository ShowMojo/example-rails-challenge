class CreditCardChargesController < ApplicationController

  def index
    @successful_charges = CreditCardCharge.includes(:customer).successful
    @disputed_charges = CreditCardCharge.includes(:customer).disputed
    @failed_charges = CreditCardCharge.includes(:customer).failed
  end

end
