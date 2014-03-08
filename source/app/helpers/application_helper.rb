module ApplicationHelper
  def price_precision(price)
    if price.is_a?(BigDecimal)
      (price.round == price) ? 0 : 2
    else
      return nil
    end
  end
end
