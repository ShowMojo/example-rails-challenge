class ChargeDecorator < ApplicationDecorator
  def customer_name
    helpers.content_tag :p do
      "Customer name: #{customer.first_name} #{customer.last_name}"
    end
  end

  def amount
    helpers.content_tag :p do
      "Amount: #{object.amount}"
    end
  end

  def created
    helpers.content_tag :p do
      "Charge date: #{object.created.strftime('%a %m/%d/%y%l:%M %p')}"
    end
  end

  private

  def customer
    @customer ||= object.customer
  end
end
