class ChargesController < ApplicationController
  def index
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @success_charges = Charge.successfull
  end
end
