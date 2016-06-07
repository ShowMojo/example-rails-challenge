class ChargesController < ApplicationController
  def index
    @failed_charges = Charge.where(paid: false)
    @disputed_charges = Charge.where(refunded: true)
    @successful_charges = Charge.where(paid: true, refunded: false)
  end
end
