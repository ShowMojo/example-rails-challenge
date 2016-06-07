class CreaditchargesController < ApplicationController
  before_action :set_creaditcharge, only: [:show, :edit, :update, :destroy]

  # GET /creaditcharges
  # GET /creaditcharges.json
  def index
    @creaditcharges = Creaditcharge.all
  end

  # GET /creaditcharges/1
  # GET /creaditcharges/1.json
  def show
  end

  # GET /creaditcharges/new
  def new
    @creaditcharge = Creaditcharge.new
  end

  # GET /creaditcharges/1/edit
  def edit
  end

  # POST /creaditcharges
  # POST /creaditcharges.json
  def create
    @creaditcharge = Creaditcharge.new(creaditcharge_params)

    respond_to do |format|
      if @creaditcharge.save
        format.html { redirect_to @creaditcharge, notice: 'Creaditcharge was successfully created.' }
        format.json { render :show, status: :created, location: @creaditcharge }
      else
        format.html { render :new }
        format.json { render json: @creaditcharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creaditcharges/1
  # PATCH/PUT /creaditcharges/1.json
  def update
    respond_to do |format|
      if @creaditcharge.update(creaditcharge_params)
        format.html { redirect_to @creaditcharge, notice: 'Creaditcharge was successfully updated.' }
        format.json { render :show, status: :ok, location: @creaditcharge }
      else
        format.html { render :edit }
        format.json { render json: @creaditcharge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creaditcharges/1
  # DELETE /creaditcharges/1.json
  def destroy
    @creaditcharge.destroy
    respond_to do |format|
      format.html { redirect_to creaditcharges_url, notice: 'Creaditcharge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creaditcharge
      @creaditcharge = Creaditcharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creaditcharge_params
      params.require(:creaditcharge).permit(:paid, :amount, :currency, :refunded)
    end
end
