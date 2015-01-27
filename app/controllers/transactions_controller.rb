class TransactionsController < ApplicationController
  def create
    @mycustomer = Mycustomer.find(params[:mycustomer_id])
    @transaction = @mycustomer.transactions.create(transaction_params)
    redirect_to mycustomer_path(@mycustomer)
  end
 
	def index
		@transactions = Transaction.where('paid' => true)
		@transactions2 = Transaction.where('refunded' => false).where('paid' => false)
		@transactions3 = Transaction.where('refunded' => true)
	end

  private
	def transaction_params
		params.require(:transaction).permit(:paid, :refunded, :disputed, :amount, :currency)
	end
end
