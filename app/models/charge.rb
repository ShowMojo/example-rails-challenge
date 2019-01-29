class Charge < ActiveRecord::Base
  belongs_to :customer
  before_save :set_created

  def set_created
    self.created = Time.now.to_i - 100000 * Charge.all.count
  end

  def timestamp_to_date()
    Time.at(self.created).strftime('%Y-%m-%d')
  end
end
