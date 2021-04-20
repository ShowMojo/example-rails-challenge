class Charge < ActiveRecord::Base
  belongs_to :customer

  # we can put indexes on columns to make the queries faster

  scope :failed, -> { where("NOT paid") }
  scope :disputed, -> { where("refunded") }
  scope :successful, -> { where("paid") }
end
