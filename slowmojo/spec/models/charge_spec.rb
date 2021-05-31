require 'rails_helper'

RSpec.describe Charge, type: :model do
  subject(:charge) { FactoryBot.create :charge }

  it { is_expected.to validate_presence_of(:created) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:customer_id) }

  it { is_expected.to belong_to(:customer) }
end
