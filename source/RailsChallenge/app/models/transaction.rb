class Transaction < ActiveRecord::Base
  belongs_to :customer

  validate :transaction_status

  scope :filter_transaction, ->(paid: nil, refunded: nil){
    where(paid: paid, refunded: refunded)
  }
  def transaction_status
    if self.paid && self.refunded
      errors.add(:base, "Please select paid or refunded both can't select.")
    end
  end

  def create_date
    Time.at(self.created).strftime("%Y-%d-%m %H:%M")
  end

  def amount_in_doller
    (self.amount.to_f/100).round(2)
  end
end
