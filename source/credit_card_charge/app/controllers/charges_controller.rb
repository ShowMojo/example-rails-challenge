class ChargesController < ApplicationController
  def index
    @successful_transactions = Charge.where(paid: true, refunded: false).includes(:customer)
    @failed_transactions = Charge.where(paid: false).includes(:customer)
    @disputed_transactions = Charge.where(paid: true, refunded: true).includes(:customer)
  end
end
