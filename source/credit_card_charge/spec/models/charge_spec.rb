require 'rails_helper'

describe Charge, type: :model do

  context 'scopes for charge statuses' do
    let(:failed) { (1..5).map { create(:charge, :failed) } }
    let(:disputed) { (1..5).map { create(:charge, :disputed) } }
    let(:successful) { (1..5).map { create(:charge, :successful) } }

    context 'without scope' do
      it "returns all charges" do
        charges = [failed, disputed, successful].flatten

        expect(Charge.all.count).to be charges.count
      end
    end
  
    context '.failed' do
      it "returns failed charges correctly" do
        expect(Charge.failed).to match_array(failed)
      end
    end

    context '.disputed' do
      it "returns disputed charges correctly" do
        expect(Charge.disputed).to match_array(disputed)
      end
    end

    context '.successful' do
      it "returns successful charges correctly" do
        expect(Charge.successful).to match_array(successful)
      end
    end
  end
end
