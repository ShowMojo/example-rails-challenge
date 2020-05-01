class Customer < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name.humanize} #{last_name.humanize}"
  end
end
