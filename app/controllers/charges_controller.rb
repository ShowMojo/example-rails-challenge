class ChargesController < ApplicationController
  def index
    charges             = ChargeDecorator.decorate_collection(Charge.all)
    @failed_charges     = charges.select(&:failed?)
    @disputed_charges   = charges.select(&:disputed?)
    @successful_charges = charges.select(&:successful?)
  end
end
