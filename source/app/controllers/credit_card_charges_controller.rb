class CreditCardChargesController < ApplicationController
  before_action :set_credit_card_charge, only: [:show, :edit, :update, :destroy]

  # GET /credit_card_charges
  # GET /credit_card_charges.json
  def index
    @credit_card_charges = CreditCardCharge.successful.all
  end

  # GET /credit_card_charges/1
  # GET /credit_card_charges/1.json
  def show
  end

  # GET /credit_card_charges/new
  def new
    @credit_card_charge = CreditCardCharge.new
  end

  # GET /credit_card_charges/1/edit
  def edit
  end

  # POST /credit_card_charges
  # POST /credit_card_charges.json
  def create
    @credit_card_charge = CreditCardCharge.new(credit_card_charge_params)

    respond_to do |format|
      if @credit_card_charge.save
        format.html { redirect_to @credit_card_charge, notice: 'Credit card charge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @credit_card_charge }
      else
        format.html { render action: 'new' }
        format.json { render json: @credit_card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_card_charges/1
  # PATCH/PUT /credit_card_charges/1.json
  def update
    respond_to do |format|
      if @credit_card_charge.update(credit_card_charge_params)
        format.html { redirect_to @credit_card_charge, notice: 'Credit card charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @credit_card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_charges/1
  # DELETE /credit_card_charges/1.json
  def destroy
    @credit_card_charge.destroy
    respond_to do |format|
      format.html { redirect_to credit_card_charges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_charge
      @credit_card_charge = CreditCardCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_card_charge_params
      params.require(:credit_card_charge).permit(:paid, :amount, :currency, :refunded, :customer_id)
    end
end
