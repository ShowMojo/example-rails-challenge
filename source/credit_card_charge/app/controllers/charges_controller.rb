class ChargesController < ApplicationController
  def charges
    get_charges_list
  end

  private

  def get_charges_list
    @failed_charges = Charges.failed
    @disputed_charges = Charges.disputed
    @successful_charges = Charges.successful
  end
end
