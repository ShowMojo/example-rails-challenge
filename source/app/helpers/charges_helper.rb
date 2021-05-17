module ChargesHelper
  def show_amount(amount, currency)
    number_to_currency(amount / 100, unit: currency_unit(currency))
  end

  def currency_unit(currency)
    {
      usd: '$',
    }[currency.to_sym]
  end
end
