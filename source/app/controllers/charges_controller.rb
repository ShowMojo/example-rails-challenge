class ChargesController < ApplicationController
  def index
    @failed_charges = Transaction.failed_charges
    @disputed_charges = Transaction.disputed_charges
    @successful_charges = Transaction.successful_charges
  end
end
