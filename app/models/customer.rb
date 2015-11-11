# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  firstname  :string           not null
#  lastname   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base

  has_many :credit_card_charges, dependent: :destroy

end
