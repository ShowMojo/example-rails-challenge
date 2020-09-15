# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  paid        :boolean
#  amount      :float
#  currency    :string
#  refunded    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Charge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
