class WelcomeController < ApplicationController

  def index
    @successful_transactions = Transaction.successful_transactions
    @failed_transactions = Transaction.failed_transactions
    @disputed_transactions = Transaction.disputed_transactions
  end

end
