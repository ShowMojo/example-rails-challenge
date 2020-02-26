# frozen_string_literal: true

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
class Charge < ApplicationRecord
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }

  belongs_to :customer
end
