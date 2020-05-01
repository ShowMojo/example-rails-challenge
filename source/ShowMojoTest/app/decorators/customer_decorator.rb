class CustomerDecorator < SimpleDelegator
  def name
    first_name.humanize + last_name.humanize
  end
end
