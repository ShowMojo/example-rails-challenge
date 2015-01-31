class CardChargesController < ApplicationController
  def index
    @failed,@successful,@disputed = CardCharge.failed,CardCharge.successful, CardCharge.disputed
  end
end
