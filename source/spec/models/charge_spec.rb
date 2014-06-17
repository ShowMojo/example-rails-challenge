require 'spec_helper'

describe Charge do
  let(:failed) { FactoryGirl.create(:charge, :failed) }
  let(:disputed) { FactoryGirl.create(:charge, :disputed) }
  let(:successful) { FactoryGirl.create(:charge, :successful) }

  context '.failed' do
    it { Charge.failed.should include(failed) }
    it { Charge.failed.should_not include(disputed) }
    it { Charge.failed.should_not include(successful) }
  end

  context '.disputed' do
    it { Charge.disputed.should_not include(failed) }
    it { Charge.disputed.should include(disputed) }
    it { Charge.disputed.should_not include(successful) }
  end

  context '.successful' do
    it { Charge.successful.should_not include(failed) }
    it { Charge.successful.should_not include(disputed) }
    it { Charge.successful.should include(successful) }
  end
end

