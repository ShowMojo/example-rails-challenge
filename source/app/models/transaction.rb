class Transaction < ActiveRecord::Base
  def self.successful_transactions
    where('paid = ? and disputed = ?', true, false)
  end

  def self.failed_transactions
    where('paid = ? and disputed = ?', false, false)
  end

  def self.disputed_transactions
    where('paid = ? and disputed = ?', true, true)
  end

  def name
    customer = Customer.find(customer_id)
    "#{customer.first_name} #{customer.last_name}"
  end
end
