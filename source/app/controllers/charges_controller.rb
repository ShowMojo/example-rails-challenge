class ChargesController < ApplicationController
  def index
    @charges_failed = Charge.failed
    @charges_successful = Charge.successful
    @charges_disputed = Charge.disputed
  end
end
