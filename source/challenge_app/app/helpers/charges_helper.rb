module ChargesHelper
  def safe_customer_name(charge)
    charge&.customer&.full_name || t('destroyed_customer.name')
  end
end
