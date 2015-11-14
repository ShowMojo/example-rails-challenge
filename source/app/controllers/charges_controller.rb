class ChargesController < ApplicationController
  expose(:failed_charges) { Charge.failed.decorate }
  expose(:disputed_charges) { Charge.disputed.decorate }
  expose(:successful_charges) { Charge.successful.decorate }

  def index
  end
end
