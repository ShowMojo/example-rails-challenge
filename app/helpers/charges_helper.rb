# frozen_string_literal: true

# helper methods related to charges
module ChargesHelper
  def amount(charge)
    unit = charge.currency.upcase + ' '
    number_to_currency(charge.amount, precision: 2, unit: unit)
  end
end
