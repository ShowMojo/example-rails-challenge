require 'rails_helper'

RSpec.describe Customer, type: :model do

  it { should have_many :charges }

  it { should validate_presence_of :first_name }
  it { should validate_length_of(:first_name).is_at_most(50) }
  it { should validate_presence_of :last_name }
  it { should validate_length_of(:last_name).is_at_most(50) }

  describe '#name' do
    it { expect(build(:customer, first_name: 'John', last_name: 'Smith').name).to eq 'John Smith' }
  end
end
