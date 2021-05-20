class Charge < ApplicationRecord
  belongs_to :customer

  scope :successful, -> {where(paid: true, refunded: false)}
  scope :failed, -> {where(paid: false)}
  scope :disputed, -> {where(paid: true, refunded: true)}

  delegate :first_name, to: :customer, prefix: true
end
