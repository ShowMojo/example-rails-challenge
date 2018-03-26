module CardChargesHelper

  def customer_name(customer)
    "#{customer.first_name} #{customer.last_name}"
  end


end
