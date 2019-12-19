class ChargesController < ApplicationController
  def index
    @failed = Charge.includes(:customer).failed
    @successful = Charge.includes(:customer).successful
    @disputed = Charge.includes(:customer).disputed
  end  
end