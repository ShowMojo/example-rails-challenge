module ChargeHelper
  def customer_full_name(charge)
    [charge.customer.first_name, charge.customer.last_name].join(" ")
  end

  def amount(charge)
    number_to_currency(charge.amount / 100.0)
  end

  def created(charge)
    charge.created.strftime("%B %d, %Y %a")
  end

  def li(charge)
    [customer_full_name(charge), amount(charge), created(charge)].join(", ")
  end
end
