require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:charges) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
