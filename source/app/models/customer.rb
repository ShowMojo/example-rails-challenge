class Customer < ActiveRecord::Base
  has_many :card_charges

  def full_name
    "#{first_name} #{last_name}"
  end
end
