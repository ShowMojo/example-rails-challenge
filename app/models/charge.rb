class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, presence: true
  validates :created, presence: true

  enum status: [:successful, :failed, :disputed]
end
