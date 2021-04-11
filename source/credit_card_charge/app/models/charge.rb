class Charge < ApplicationRecord
  belongs_to :customer

  scope :successful, ->{ where(paid: true, refunded: false) }
  scope :failed, ->{ where(paid: false) }
  scope :disputed, ->{ where(paid: true, refunded: true) }

  delegate :name, to: :customer, prefix: true

  alias_attribute :created, :created_at

  #TODO extract to a decorator
  def human_amount
    [amount / 100, currency].join(' ')
  end
end
