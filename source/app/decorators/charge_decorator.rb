class ChargeDecorator < Draper::Decorator
  def customer_name
    object.customer.decorate.full_name
  end

  def amount
    h.number_to_currency(object.amount, currency: object.currency)
  end

  def date
    Time.at(object.created).strftime('%m/%d/%Y')
  end
end
