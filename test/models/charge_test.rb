# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  paid        :boolean
#  amount      :integer
#  currency    :string
#  refunded    :boolean
#  customer_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ChargeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
