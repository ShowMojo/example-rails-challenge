class Transaction < ApplicationRecord

  STATUS = { successful: 1, failed: 2, disputed: 3 }

  belongs_to :customer

  delegate :name, to: :customer, prefix: :customer

  scope :successful, -> { includes(:customer).where(status: STATUS[:successful]) }
  scope :failed,     -> { includes(:customer).where(status: STATUS[:failed]) }
  scope :disputed,   -> { includes(:customer).where(status: STATUS[:disputed]) }

  def amount_dollar
    self.amount/100.0
  end

  class << self

      def fetch_all
        [ successful, disputed, failed ]
      end

  end
end
