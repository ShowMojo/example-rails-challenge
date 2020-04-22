class Customer < ActiveRecord::Base
  def name
    [first_name, last_name].join(" ")
  end
end
