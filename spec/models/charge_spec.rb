# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  paid        :boolean
#  amount      :float
#  currency    :string
#  refunded    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:amount) }
  end

  describe 'attributes' do

    let(:charge) { create(:charge, paid: true, refunded: false) }

    it 'has all expected attributes with the right data' do
      expect(charge).to have_attributes(paid: true, refunded: false, amount: charge.amount)
    end
  end
end
