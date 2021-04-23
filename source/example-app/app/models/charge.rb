class Charge < ActiveRecord::Base
  belongs_to :customer

  # I'm not fully knowing the conditions to filter the different types
  # I can investigate them, but it's going to take me longer to complete the challenge
  #
  # we can put indexes on columns to make the queries faster

  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }
end
