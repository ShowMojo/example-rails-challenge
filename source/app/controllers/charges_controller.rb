class ChargesController < ApplicationController
  def index
    @charges = Charges::ChargeQuery.new
  end
end
