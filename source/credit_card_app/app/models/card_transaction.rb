class CardTransaction < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { includes(:customer).where(paid: true, refunded: false) }
  scope :failed, -> { includes(:customer).where(paid: false, refunded: false) }
  scope :disputed, -> { includes(:customer).where(paid: true, refunded: true) }
end
