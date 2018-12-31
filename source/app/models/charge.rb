class Charge < ActiveRecord::Base

  STATUS_SUCCESSFUL = 1
  STATUS_FAILED     = 2
  STATUS_DISPUTED   = 3

  belongs_to :customer

  scope :successful, -> { where(status: STATUS_SUCCESSFUL) }
  scope :failed,     -> { where(status: STATUS_FAILED) }
  scope :disputed,   -> { where(status: STATUS_DISPUTED) }

  def amount_dollar
    self.amount/100.0
  end
end
