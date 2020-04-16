require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
  end

  describe 'validations' do
    it { should validate_presence_of(:created) }
    it { should validate_presence_of(:paid) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:refunded) }
  end
end
