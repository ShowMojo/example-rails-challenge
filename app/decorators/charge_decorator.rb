class ChargeDecorator < Draper::Decorator
  delegate_all

  def details
    "#{customer.name}: #{amount}&cent; on #{updated_at}".html_safe
  end

  def updated_at
    object.updated_at.to_formatted_s(:long)
  end
end
