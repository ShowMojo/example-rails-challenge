class Customer < ActiveRecord::Base

  has_many :charges

  def fullname
    "#{first_name} #{last_name}"
  end

end
