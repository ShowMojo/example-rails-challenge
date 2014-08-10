class Customer < ActiveRecord::Base
  has_many :charges

  def name
    "#{first_name} #{last_name}"
  end
end
