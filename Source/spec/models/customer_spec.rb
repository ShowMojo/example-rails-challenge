require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  it { is_expected.to have_many(:charges) }

  it 'instance returns the full name' do
    customer = FactoryBot.create(:customer)
    expect(customer.name).to eq(customer.first_name + ' ' + customer.last_name)
  end
end