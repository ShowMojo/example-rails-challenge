module CreditCardChargesHelper
  def charge_li(charge)
    "Customer: #{charge.customer.full_name}, Amount: #{charge.amount/100.0}, Date: #{charge.updated_at}"
  end
end