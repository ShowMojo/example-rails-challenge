class Charge < ActiveRecord::Base
  belongs_to :customer
  before_create :set_created

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  protected

  def set_created
    self.created = Time.now.to_i
  end
end
