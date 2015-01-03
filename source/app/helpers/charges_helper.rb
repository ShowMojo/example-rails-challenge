module ChargesHelper
  def charge_details(charge)
    "#{charge.customer.first_name}, #{charge.amount}, #{charge.updated_at}"
  end
end
