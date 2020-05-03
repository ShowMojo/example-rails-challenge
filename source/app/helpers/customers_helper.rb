# frozen_string_literal: true

# helper methods related to customer
module CustomersHelper
  def customer_name(customer)
    "#{customer.first_name} #{customer.last_name}"
  end
end
