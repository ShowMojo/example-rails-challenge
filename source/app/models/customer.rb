class Customer < ActiveRecord::Base
  has_many :charges

  def name
    [first_name, last_name].compact.join(" ")
  end
end
