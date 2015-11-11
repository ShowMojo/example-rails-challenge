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

require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  it { should belong_to(:customer) }
end
