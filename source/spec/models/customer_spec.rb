require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { FactoryBot.create :customer }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to have_many(:charges).dependent(:destroy) }
end
