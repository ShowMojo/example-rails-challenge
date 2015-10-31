class ChargesController < ApplicationController
  before_action :load_resources, only: :index

  def index; end

private

  def load_resources
    @successful_charges = Charge.successful.includes(:customer)
    @disputed_charges = Charge.disputed.includes(:customer)
    @failed_charges = Charge.failed.includes(:customer)
  end
end
