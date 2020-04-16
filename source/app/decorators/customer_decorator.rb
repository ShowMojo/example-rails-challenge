class CustomerDecorator < Draper::Decorator
  def full_name
    [object.first_name, object.last_name].join(' ')
  end
end
