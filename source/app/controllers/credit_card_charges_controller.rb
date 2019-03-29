class CreditCardChargesController < ApplicationController
  def index
    @successful = CreditCardCharge.successful
    @failed = CreditCardCharge.failed
    @disputed = CreditCardCharge.disputed
  end
end
