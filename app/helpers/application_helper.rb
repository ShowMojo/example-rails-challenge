module ApplicationHelper
  def in_dollar(cent)
    return "$#{cent/100}.#{cent%100}" unless cent.zero?
    return 0
  end
end
