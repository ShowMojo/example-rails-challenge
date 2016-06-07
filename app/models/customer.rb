class Customer < ActiveRecord::Base

  has_many :creaditcharges

  def fullname
    [self.first_name, self.last_name].join(' ')
  end
end
