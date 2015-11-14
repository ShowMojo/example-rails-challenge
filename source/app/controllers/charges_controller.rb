class ChargesController < ApplicationController
  expose(:failed_charges) { Charge.failed }
  expose(:disputed_charges) { Charge.disputed }
  expose(:successful_charges) { Charge.successful }

  def index
  end
end
