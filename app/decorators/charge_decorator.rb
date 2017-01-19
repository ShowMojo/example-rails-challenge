class ChargeDecorator < Draper::Decorator
  delegate_all

  def details
    "#{customer.name} (#{amount}) [#{updated_at}]"
  end

  def updated_at
    object.updated_at.to_formatted_s(:long)
  end
end
