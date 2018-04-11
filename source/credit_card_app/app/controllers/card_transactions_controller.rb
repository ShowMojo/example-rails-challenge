class CardTransactionsController < ApplicationController
  def charges
    @successful_transactions = CardTransaction.successful
    @failed_transactions = CardTransaction.failed
    @disputed_transactions = CardTransaction.disputed
  end
end
