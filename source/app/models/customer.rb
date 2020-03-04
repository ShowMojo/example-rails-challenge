class Customer < ApplicationRecord

  def to_s
    "#{last_name}, #{first_name}"
  end
end
