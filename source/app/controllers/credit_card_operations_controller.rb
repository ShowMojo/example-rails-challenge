class CreditCardOperationsController < ApplicationController
  before_action :set_credit_card_operation, only: [:show, :edit, :update, :destroy]
  before_action :set_form, only: [:new, :edit]

  # GET /credit_card_operations
  # GET /credit_card_operations.json
  def index
    @credit_card_operations = CreditCardOperation.all
  end

  def charges
    @successful_operations = CreditCardOperation.successful
    @disputed_operations = CreditCardOperation.disputed
    @failed_operations = CreditCardOperation.failed
  end

  # GET /credit_card_operations/1
  # GET /credit_card_operations/1.json
  def show
  end

  # GET /credit_card_operations/new
  def new
    @credit_card_operation = CreditCardOperation.new
  end

  # GET /credit_card_operations/1/edit
  def edit
  end

  # POST /credit_card_operations
  # POST /credit_card_operations.json
  def create
    @credit_card_operation = CreditCardOperation.new(credit_card_operation_params)

    respond_to do |format|
      if @credit_card_operation.save
        format.html { redirect_to @credit_card_operation, notice: 'Credit card operation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @credit_card_operation }
      else
        format.html { render action: 'new' }
        format.json { render json: @credit_card_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_card_operations/1
  # PATCH/PUT /credit_card_operations/1.json
  def update
    respond_to do |format|
      if @credit_card_operation.update(credit_card_operation_params)
        format.html { redirect_to @credit_card_operation, notice: 'Credit card operation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @credit_card_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_operations/1
  # DELETE /credit_card_operations/1.json
  def destroy
    @credit_card_operation.destroy
    respond_to do |format|
      format.html { redirect_to credit_card_operations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_operation
      @credit_card_operation = CreditCardOperation.find(params[:id])
    end

  def set_form
    @users = User.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_card_operation_params
      params.require(:credit_card_operation).permit(:paid, :amount, :currency, :refunded, :user_id)
    end
end
