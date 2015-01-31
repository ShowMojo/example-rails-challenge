class CardChargesController < ApplicationController
  def index
     @failed,@successful,@disputed = CardCharge.failed.includes(:customer),
                                     CardCharge.successful.includes(:customer),
                                     CardCharge.disputed.includes(:customer)

  end
end
