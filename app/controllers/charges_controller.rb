class ChargesController < ApplicationController

  def index
    @charges_failed = Charge.where("paid = ? AND refunded = ?", false, false).order(:paid).order(refunded: :desc)
    @charges_disputed = Charge.where("paid = ? AND refunded = ?", false, true).order(:paid).order(refunded: :desc)
    @charges_success = Charge.where(paid: true)
  end

end
