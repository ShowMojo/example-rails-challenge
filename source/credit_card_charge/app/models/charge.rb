class Charge < ActiveRecord::Base
  belongs_to :customer

  def display_amount
    "#{amount.to_f / 100} #{currency}"
  end

  def display_created
    DateTime.strptime(created.to_s, '%s').strftime('%a, %b %Y %I:%M %p')
  end

  def self.failed_charges
    Charge.where(paid: false, refunded: true)
  end

  def self.disputed_charges
    Charge.where(paid: false, refunded: false)
  end

  def self.successful_charges
    Charge.where(paid: true, refunded: false)
  end
end
