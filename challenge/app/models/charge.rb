class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed,     -> { where(paid: false) }
  scope :disputed,   -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }

  delegate :full_name, to: :customer, prefix: true


  def date
    DateTime.strptime(created.to_s, '%s')
  end

  def display_amount
    amount / 100.0
  end
end
