# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base

  has_many :credit_card_charges

end
