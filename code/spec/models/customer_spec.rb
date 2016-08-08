require 'rails_helper'

RSpec.describe Customer, type: :model do

  it { should have_many :charges }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
 
  describe '#full_name' do
    it { expect(build(:customer, first_name: 'John', last_name: 'Smith').full_name).to eq 'John Smith' }
  end
end