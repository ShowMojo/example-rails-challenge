class Charge < ActiveRecord::Base
  belongs_to :customer, required: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def formated_amount
    "$ #{amount / 1000.0}"
  end

  def formated_date
    Time.at(created).to_datetime.strftime('%c')
  end
end
