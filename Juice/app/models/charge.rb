class Charge < ApplicationRecord
  belongs_to :customer

  before_validation :set_created

  validates :created, :amount, :currency, presence: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  private

  def set_created
    self.created = Time.current.to_i
  end
end
