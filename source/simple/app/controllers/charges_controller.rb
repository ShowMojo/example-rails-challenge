class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @failed = Charge.failed.includes(:customer)
    @disputed = Charge.disputed.includes(:customer)
    @successful = Charge.successful
  end
end
