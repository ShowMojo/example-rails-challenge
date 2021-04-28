class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, :currency, :customer, presence: true

  before_save :assign_created

  scope :disputed,   -> { where(refunded: true) }
  scope :failed,     -> { where(paid: false) }
  scope :successful, -> { where(paid: true, refunded: false) }

  private
    def assign_created
      self.created = Time.now.to_i
    end
end
