class ChargesController < ApplicationController

  def index
    @failed = Charge.failed.includes(:customer)
    @disputed = Charge.disputed.includes(:customer)
    @successful = Charge.successful.includes(:customer)
  end
end
