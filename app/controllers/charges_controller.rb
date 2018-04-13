class ChargesController < ApplicationController
  def index
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @succeed_charges = Charge.succeed
  end
end
