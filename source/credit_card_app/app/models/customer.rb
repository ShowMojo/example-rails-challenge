class Customer < ActiveRecord::Base
  has_many :card_transactions

  def full_name
    "#{first_name} #{last_name}"
  end
end
