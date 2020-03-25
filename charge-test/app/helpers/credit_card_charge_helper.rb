module CreditCardChargeHelper
  def display_amount(charge)
    number_to_currency(charge.amount / 100, precision: 3)
  end

  def display_time(charge)
    Time.at(charge.created)
  end
end
