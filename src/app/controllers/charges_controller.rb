class ChargesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        @charges = Charge.all
      end
    end
  end
end
