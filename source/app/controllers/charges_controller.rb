# frozen_string_literal: true

# Charges controller
class ChargesController < ApplicationController
  # GET /charges
  # GET /charges.json
  def index
    @successful = Charge.successful.group_by(&:customer)
    @failed     = Charge.failed.group_by(&:customer)
    @disputed   = Charge.disputed.group_by(&:customer)
  end
end
