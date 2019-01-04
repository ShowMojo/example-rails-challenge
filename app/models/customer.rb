class Customer < ApplicationRecord
  has_many :transactions

  def name
    [first_name, last_name].join(' ')
  end
end
