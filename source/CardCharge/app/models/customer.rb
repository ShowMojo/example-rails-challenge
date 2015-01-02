class Customer < ActiveRecord::Base
  has_many :charges

  def fullname
    "#{self.firstname} #{self.lastname}"
  end
end
