class CardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(status: 2) }
  scope :successful, -> { where(status: 1) }
  scope :disputed, -> { where(status: 3) }
  
end
