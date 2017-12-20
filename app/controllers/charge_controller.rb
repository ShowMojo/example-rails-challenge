class ChargeController < ApplicationController
  def charges
    @successful_transactions = Charge.successful
    @failed_transactions = Charge.failed
    @disputed_transactions = Charge.disputed
  end
end
