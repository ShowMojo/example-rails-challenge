class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, presence: true
  validates :created, presence: true

  enum status: [:successful, :failed, :disputed]

  def converted_amount
    self.amount.to_f / 100
  end
end
