# frozen_string_literal: true
class ChargesController < ApplicationController
  def index
    return_charges
  end

  private

  def return_charges
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @successful_charges = Charge.successful
  end
end
