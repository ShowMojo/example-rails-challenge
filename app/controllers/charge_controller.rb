class ChargeController < ApplicationController
  layout "application"

  def index
    @failed = Charge.failed
    @disputed = Charge.disputed
    @successful = Charge.successful
  end
end
