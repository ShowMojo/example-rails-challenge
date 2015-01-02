class ChargesController < ApplicationController
  def index
    @charges = Charge.grouped_by_states
  end
end
