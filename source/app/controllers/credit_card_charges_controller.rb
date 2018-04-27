class CreditCardChargesController < ApplicationController
  def index
    @paid = CreditCardCharge.paid
    @failed = CreditCardCharge.failed
    @disputed = CreditCardCharge.disputed
  end
end
