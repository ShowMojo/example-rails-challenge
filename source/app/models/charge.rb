class Charge < ApplicationRecord
  belongs_to :customer

  validates_presence_of :amount, :created, :customer_id

  scope :for_customer, lambda { |customer_id|
    where(customer_id: customer_id)
  }

  scope :paid, lambda {
    where(paid: true, disputed: false, refunded: false)
  }

  scope :failed, lambda {
    where(paid: false, disputed: false, refunded: false)
  }

  scope :disputed, lambda {
    where(paid: false, disputed: true, refunded: false)
  }

  scope :refunded, lambda {
    where(paid: true, disputed: false, refunded: true)
  }

  def created_in_date
    Time.at(created.to_i)
  end
end
