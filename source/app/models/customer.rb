class Customer < ApplicationRecord
  def customer_name
    [first_name, last_name].join(' ')
  end
end
