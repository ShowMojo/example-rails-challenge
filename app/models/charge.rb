class Charge < ActiveRecord::Base
  STATUS = {
    successful: 0,
    failed: 1,
    disputed: 2
  }.freeze

  enum status: STATUS

  belongs_to :customer

  def to_partial_path
    status.to_s
  end
end
