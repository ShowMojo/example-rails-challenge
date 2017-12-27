class Charge < ActiveRecord::Base
  belongs_to :customer

  delegate :name, to: :customer, prefix: true

  scope :successful, -> { where(paid: true, refunded: false)}
  scope :failed, -> { where(paid: false)}
  scope :disputed, -> { where(paid: true, refunded: true)}

  monetize :amount, as: :cents
end