module ChargesHelper
  def in_usd(cent)
    return "$#{cent/100}.#{cent%100}" unless cent.zero?
    return 0
  end
end
