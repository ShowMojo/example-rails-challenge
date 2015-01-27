class MycustomersController < ApplicationController
	def new
		@mycustomer = Mycustomer.new
	end

	def create
		# render plain: params[:mycustomer].inspect
		@mycustomer = Mycustomer.new(mycustomer_params)
		@mycustomer.save

		redirect_to @mycustomer
	end

	def update
	  @mycustomer = Mycustomer.find(params[:id])
	 
	  if @mycustomer.update(mycustomer_params)
	    redirect_to transactions_path
	  end
	end

	def edit
		@mycustomer = Mycustomer.find(params[:id])
	end

	def show
		@mycustomer = Mycustomer.find(params[:id])
	end

	def index
		@mycustomers = Mycustomer.all
	end

	private
	def mycustomer_params
		params.require(:mycustomer).permit(:firstName, :lastName, :email)
		
	end
end
