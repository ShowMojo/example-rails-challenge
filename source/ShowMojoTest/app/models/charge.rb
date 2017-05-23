class Charge < ActiveRecord::Base
  #Validation is required because checkout limits amount length
  monetize :amount_cents, :allow_nil => false, :numericality => {
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10000
  }

  belongs_to :customer, required: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :refuned, -> { where(paid: true, refuned: true) }

end
