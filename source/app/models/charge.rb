class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { where(paid: true, refounded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refounded: true) }
end
