class Charge < ActiveRecord::Base
  belongs_to :customer
 
  validates_presence_of :customer, :currency, :amount
  validates_inclusion_of :paid, :refunded, in: [true, false]
  validates_numericality_of :amount, :only_integer => true, :greater_than_or_equal_to => 0
 
  scope :successful, -> { where(paid: true, refunded: false) }
  scope :disputed, -> { where(paid:true, refunded: true) }
  scope :failed,  -> { where(paid: false) }
end
