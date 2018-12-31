class ChargesController < ApplicationController
  def index
    @successful = Charge.successful
    @failed     = Charge.failed
    @disputed   = Charge.disputed
  end
end
