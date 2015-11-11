# == Schema Information
#
# Table name: credit_card_charges
#
#  id          :integer          not null, primary key
#  customer_id :integer          not null
#  paid        :boolean          default(FALSE)
#  amount      :decimal(, )
#  refunded    :boolean          default(FALSE)
#  currency    :string           default("usd")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CreditCardCharge < ActiveRecord::Base

  belongs_to :customer

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :disputed,   -> { where(paid: true, refunded: true) }
  scope :failed,     -> { where(paid: false, refunded: false) }

  def money_amount
    @money_amount ||= Money.new(self.amount, self.currency)
  end

  def pretty_amount
    money_amount.format
  end

end