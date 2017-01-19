class ChargesController < ApplicationController
  def index
    @charges = Charge.includes(:customer).all
    @succeed = @charges.succeed
    @failed = @charges.failed
    @disputed = @charges.disputed
  end
end
