class ChargesController < ApplicationController
  def index
    @charges = Charge

    respond_to do |format|
      format.html do
        @charges = @charges.includes(:customer)
        @list_failed = @charges.where(state: 1)
        @list_disputed = @charges.where(state: 2)
        @list_success = @charges.where(state: 0)
      end
      format.json
    end
  end
end
