class ChargesController < ApplicationController
  def index
    @charges = Charge.includes(:customer)
  end
end
