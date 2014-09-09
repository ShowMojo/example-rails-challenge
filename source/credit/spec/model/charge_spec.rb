require "rails_helper"

RSpec.describe Charge do
  #We need to run seed in order to past this case
  context "10 successful charges" do
    it { expect(Charge.successful_transactions.count).to eq 10 }
  end
  context "5 failed charges" do
    it { expect(Charge.failed_transactions.count).to eq 5 }
  end
  context "5 disputed charges" do
    it { expect(Charge.dispute_transactions.count).to eq 5 }
  end
end
