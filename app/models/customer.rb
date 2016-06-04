class Customer < ActiveRecord::Base

  has_many :charges

  def name
    [self.first_name, self.last_name].join(' ')
  end

end
