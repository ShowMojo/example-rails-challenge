class ChargesController < ApplicationController
  def index
    @successful_charges = Charge.where(paid: true, refunded: false)
    @failed_charges = Charge.where(paid: false, refunded: false)
    @disputed_charges = Charge.where(paid: true, refunded: true)
  end
end
