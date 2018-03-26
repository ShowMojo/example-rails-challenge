class CardChargesController < ApplicationController
  before_action :set_card_charge, only: [:show, :edit, :update, :destroy]

  # GET /card_charges
  # GET /card_charges.json
  def index
    @card_charges = CardCharge.all
  end

  # GET /card_charges/1
  # GET /card_charges/1.json
  def show
  end

  # GET /card_charges/new
  def new
    @card_charge = CardCharge.new
  end

  # GET /card_charges/1/edit
  def edit
  end

  # POST /card_charges
  # POST /card_charges.json
  def create
    @card_charge = CardCharge.new(card_charge_params)

    respond_to do |format|
      if @card_charge.save
        format.html { redirect_to @card_charge, notice: 'Card charge was successfully created.' }
        format.json { render :show, status: :created, location: @card_charge }
      else
        format.html { render :new }
        format.json { render json: @card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_charges/1
  # PATCH/PUT /card_charges/1.json
  def update
    respond_to do |format|
      if @card_charge.update(card_charge_params)
        format.html { redirect_to @card_charge, notice: 'Card charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_charge }
      else
        format.html { render :edit }
        format.json { render json: @card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_charges/1
  # DELETE /card_charges/1.json
  def destroy
    @card_charge.destroy
    respond_to do |format|
      format.html { redirect_to card_charges_url, notice: 'Card charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_charge
      @card_charge = CardCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_charge_params
      params.require(:card_charge).permit(:created, :paid, :amount, :currency, :refunded, :customer_id)
    end
end
