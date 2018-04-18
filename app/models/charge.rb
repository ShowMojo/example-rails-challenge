class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { where(paid: true, failed_date: nil, disputed_date: nil) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }

  before_save :track_action

  def format_amount
    "#{amount/100.to_f} #{currency}"
  end

  private

  def track_action
    self.disputed_date = Time.current if refunded && (new_record? || refunded_changed?)
    self.failed_date = Time.current if !paid && (new_record? || paid_changed?)
  end
end
