# == Schema Information
#
# Table name: card_charges
#
#  id          :integer          not null, primary key
#  created     :datetime
#  paid        :boolean
#  amount      :float
#  currency    :string
#  refunded    :boolean
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe CardCharge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
