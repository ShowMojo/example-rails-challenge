class ChargesController < ApplicationController
  def index
    get_charges_list
  end

  private

  def get_charges_list
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @successful_charges = Charge.successful
  end
end
