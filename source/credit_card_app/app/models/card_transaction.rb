class CardTransaction < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { includes(:customer).where(paid: true, refunded: false) }
  scope :failed, -> { includes(:customer).where(paid: false, refunded: false) }
  scope :disputed, -> { includes(:customer).where(paid: true, refunded: true) }

  def formatted_amount
    "#{currency} #{amount/100.0}"
  end

  def formatted_date
    Time.at(created).strftime('%c')
  end
end
