class ChargesController < ApplicationController
  def index
    render :index, locals: { view: ChargesViewObject.new(view_object_context) }
  end

  private

  def view_object_context
    {
      successful_charges: ChargeDecorator.decorate_collection(charges_repo.all_by_status(:successful)),
      failed_charges: ChargeDecorator.decorate_collection(charges_repo.all_by_status(:failed)),
      disputed_charges: ChargeDecorator.decorate_collection(charges_repo.all_by_status(:disputed))
    }
  end

  def charges_repo
    @charges_repo ||= ChargeRepo.new(model: Charge, customer_model: Customer)
  end
end