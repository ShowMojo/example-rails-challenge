require 'rails_helper'

RSpec.describe Charge, type: :model do
  subject(:charge) { FactoryBot.create :charge }

  it { is_expected.to validate_presence_of(:created) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:currency) }
  it { is_expected.to validate_presence_of(:customer_id) }

  it { is_expected.to belong_to(:customer) }

  describe "scopes" do
    let!(:successful) { FactoryBot.create_list :charge, 2,:successful }
    let!(:failed) { FactoryBot.create_list :charge, 2, :failed}
    let!(:disputed) { FactoryBot.create_list :charge, 2, :disputed}

    specify { expect(described_class.successful).to match_array(successful) }
  end
end
