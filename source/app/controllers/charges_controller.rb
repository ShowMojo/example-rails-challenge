class ChargesController < ApplicationController
  def index
    @charges = Charge.includes(:customer).all
  end
end
