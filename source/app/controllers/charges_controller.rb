class ChargesController < ApplicationController

  def index
    @charges = [
      {
        status: "Successful",
        data: Charge.successful.includes(:customer)
      }, 
      {
        status: "Failed",
        data: Charge.failed.includes(:customer)
      },
      {
        status: "Disputed",
        data: Charge.disputed.includes(:customer)
      }]
  end
end
