class Charge < ActiveRecord::Base
    scope :failed, -> { where(status: 'failed')}
    scope :disputed, -> { where(status: 'disputed')}
    scope :succeed, -> { where(status: 'succeed')}

    belongs_to :customer
end
