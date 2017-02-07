# == Schema Information
#
# Table name: charges
#
#  id           :integer          not null, primary key
#  paid         :boolean
#  amount_cents :integer
#  currency     :string
#  refunded     :boolean
#  customer_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Charge < ActiveRecord::Base
	belongs_to :customer
	monetize :amount_cents, with_model_curreny: :currency
end
