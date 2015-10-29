class ChargesController < ApplicationController
  def index
    @charges_failed = Charge.failed
    @charges_disputed = Charge.disputed
    @charges_successful = Charge.successful
  end
end
