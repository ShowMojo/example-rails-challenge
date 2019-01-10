class Charge < ActiveRecord::Base
  STATUS = {
    created: 0,
    successful: 1,
    failed: 2,
    disputed: 3
  }.freeze

  enum status: STATUS

  belongs_to :customer

  def failed!
    update(status: :failed, failed_at: Time.current)
  end

  def disputed!
    update(status: :disputed, disputed_at: Time.current)
  end

  def successful!
    update(status: :successful, successful_at: Time.current)
  end

  def to_partial_path
    status.to_s
  end
end
