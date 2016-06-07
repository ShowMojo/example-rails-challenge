class Customer < ActiveRecord::Base
  has_many :charges

  def full_name
    fname + " " + lname
  end
end
