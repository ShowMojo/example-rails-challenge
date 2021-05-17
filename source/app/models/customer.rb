class Customer < ApplicationRecord
  has_many :charges

  def name
    "#{first_name} #{last_name}"
  end
end
