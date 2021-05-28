class HomeController < ApplicationController
  def index
  end

  def charges
    @failed_charges = Transaction.includes(:customer).filter_transaction(paid: false, refunded: false)
    @success_charges = Transaction.includes(:customer).filter_transaction(paid: true, refunded: false)
    @disputed_charges = Transaction.includes(:customer).filter_transaction(paid: false, refunded: true)
  end
end