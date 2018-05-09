class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer
  before_create :set_time_stamp

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :customer_id, presence: true

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def amount_in_human_readable
    "#{currency.upcase} #{sprintf( "%0.02f",(amount.to_f / 100))}"
  end
  private

  def set_time_stamp
    self.created = DateTime.now if self.new_record?
  end
end
