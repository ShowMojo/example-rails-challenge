class Charge < ActiveRecord::Base
  belongs_to :customer
  
  scope :successful_transactions, -> { where('paid=? AND refunded=?',true,true) }
  scope :failed_transactions, -> { where(paid: false)}
  scope :dispute_transactions, -> { where('paid=? AND refunded=?',true,false) }

end
