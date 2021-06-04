class Charge < ApplicationRecord
  belongs_to :customer

  delegate :full_name, to: :customer

  scope :failed, -> () {where(paid: false)}
  scope :disputed, -> () {where(paid: true, refunded: true)}
  scope :successful, -> () {where(paid: true, refunded: false)}
end
