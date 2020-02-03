class Charge < ApplicationRecord
  belongs_to :customer
  scope :with_paid, -> (status) { where(paid: status) }
  scope :with_refunded, -> (status) { where(refunded: status) }
end
