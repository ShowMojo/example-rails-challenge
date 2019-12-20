class CreditCardChargesController < ApplicationController
  def index
    @payments = CreditCardCharge.all
  end
end
