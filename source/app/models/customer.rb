class Customer < ApplicationRecord
  has_many :credit_card_charges

  def full_name
    [first_name, last_name].join(' ')
  end
end
