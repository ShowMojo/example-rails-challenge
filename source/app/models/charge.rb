class Charge < ActiveRecord::Base
  belongs_to :customer
  scope :failed, -> { where(status: 'failed') }
  scope :disputed, -> { where(status: 'disputed') }
  scope :successful, -> { where(status: 'success') }

  def customer_name
    "#{customer.first_name} #{customer.last_name}"
  end
end
