class ChargesController < ApplicationController
  def index
    @failed = Charge.includes(:customer).failed
    @disputed = Charge.includes(:customer).disputed
    @successful = Charge.includes(:customer).successful
  end
end
