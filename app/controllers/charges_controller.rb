class ChargesController < ApplicationController
  def index
    @charges = Charge.all.includes(:customer)
  end
end