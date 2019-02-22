class CardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where.not(disputed_at: nil) }
  scope :succesful, -> { where(paid: true, disputed_at: nil) }

end
