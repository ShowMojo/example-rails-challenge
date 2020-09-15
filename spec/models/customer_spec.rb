# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:charges) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'attributes' do
    let(:customer) { create(:customer, first_name: 'John', last_name: 'Doe') }

    it 'has all expected attributes with the right data' do
      expect(customer).to have_attributes(first_name: 'John', last_name: 'Doe')
    end
  end
end
