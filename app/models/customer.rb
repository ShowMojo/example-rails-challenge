class Customer < ApplicationRecord
  has_many :charges

  def full_name
    ([first_name, last_name] - ['']).compact.join(' ')
  end
end
