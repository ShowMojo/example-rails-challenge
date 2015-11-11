class CreditCardChargesController < ApplicationController

  def index
    @successful = CreditCardCharge.successful
    @disputed = CreditCardCharge.disputed
    @failed = CreditCardCharge.failed
  end

end