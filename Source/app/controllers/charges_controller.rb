class ChargesController < ApplicationController
  def index
    @successful = Charge.includes(:customer).successful
    @failed = Charge.includes(:customer).failed
    @disputed = Charge.includes(:customer).disputed
  end
end
