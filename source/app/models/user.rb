class User < ActiveRecord::Base
  has_many :credit_card_operations
  def name_with_initial
    "#{first_name.first}. #{last_name}"
  end
end
