class ChargesController < ApplicationController
  def index
    @succ_charges = Charge.successful
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
  end
end
