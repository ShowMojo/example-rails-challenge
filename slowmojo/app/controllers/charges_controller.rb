class ChargesController < ApplicationController
  def index

    basic_scope = Charge.includes(:customer)
    @succesful = basic_scope.successful.to_a
    @failed = basic_scope.failed.to_a
    @disputed = basic_scope.disputed.to_a
  end
end
