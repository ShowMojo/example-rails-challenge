class Charge < ActiveRecord::Base
  belongs_to :customer

  # Scopes
  scope :successfull, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
end
