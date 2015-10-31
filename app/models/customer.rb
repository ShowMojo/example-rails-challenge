class Customer < ActiveRecord::Base
  def full_name
    "#{f_name} #{l_name}"
  end
end
