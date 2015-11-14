class ChargeDecorator < Draper::Decorator
  delegate_all

  def customer_name
    "#{customer.first_name} #{customer.last_name}"
  end

  def amount_usd
    "#{amount / 100} #{currency}"
  end

  def date
    updated_at.strftime("%B %e, %Y")
  end
end
