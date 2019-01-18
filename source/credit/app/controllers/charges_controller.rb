class ChargesController < ApplicationController
  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
  end
end
