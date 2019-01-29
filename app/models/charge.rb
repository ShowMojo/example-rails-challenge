class Charge < ActiveRecord::Base
  belongs_to :customer
  before_save :set_created

  scope :successful_charges, -> { where(paid: true, refunded: false) }
  scope :failed_charges, -> { where(paid: false)}
  scope :disputed_charges, -> { where(paid: false, refunded: true) }

  def set_created
    self.created = Time.now.to_i - 100000 * Charge.all.count
  end

  def timestamp_to_date()
    Time.at(self.created).strftime('%Y-%m-%d')
  end
end
