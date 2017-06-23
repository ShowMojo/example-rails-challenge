class C2chargesController < ApplicationController
  before_action :set_c2charge, only: [:show, :edit, :update, :destroy]

  # GET /c2charges
  # GET /c2charges.json
  def index
    @c2charges = C2charge.all

    @c2charges_failed = C2charge.where("status = 0") # failed
    @c2charges_success = C2charge.where("status = 1") # success
    @c2charges_disputed = C2charge.where("status = -1") # disputed
  end

  # GET /c2charges/1
  # GET /c2charges/1.json
  def show
  end

  # GET /c2charges/new
  def new
    @c2charge = C2charge.new
  end

  # GET /c2charges/1/edit
  def edit
  end

  # POST /c2charges
  # POST /c2charges.json
  def create
    @c2charge = C2charge.new(c2charge_params)

    respond_to do |format|
      if @c2charge.save
        format.html { redirect_to @c2charge, notice: 'C2charge was successfully created.' }
        format.json { render :show, status: :created, location: @c2charge }
      else
        format.html { render :new }
        format.json { render json: @c2charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c2charges/1
  # PATCH/PUT /c2charges/1.json
  def update
    respond_to do |format|
      if @c2charge.update(c2charge_params)
        format.html { redirect_to @c2charge, notice: 'C2charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @c2charge }
      else
        format.html { render :edit }
        format.json { render json: @c2charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c2charges/1
  # DELETE /c2charges/1.json
  def destroy
    @c2charge.destroy
    respond_to do |format|
      format.html { redirect_to c2charges_url, notice: 'C2charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c2charge
      @c2charge = C2charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c2charge_params
      params.require(:c2charge).permit(:paid, :amount, :currency, :refunded)
    end
end
