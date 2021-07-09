class Charge < ApplicationRecord
  belongs_to :customer

  enum currency: [:usd, :euro]

  validates_presence_of :created, :amount, :currency, :customer_id

  scope :failed,     -> { where("paid = ?", false).order(created: "DESC") }
  scope :disputed,   -> { where("paid = ?", true).where("refunded = ?", true).order(created: "DESC") }
  scope :successful, -> { where("paid = ?", true).where("refunded = ?", false).order(created: "DESC") }
end
