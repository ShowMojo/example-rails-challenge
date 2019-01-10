class Charge < ActiveRecord::Base
  STATUS = {
    successful: 0,
    failed: 1,
    disputed: 2
  }.freeze

  enum status: STATUS

  belongs_to :customer
end
