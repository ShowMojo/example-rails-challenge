# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ActiveRecord::Base

  def full_name
    "#{first_name} #{last_name}"
  end
end
