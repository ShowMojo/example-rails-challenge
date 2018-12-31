require 'rails_helper'

RSpec.describe Charge, type: :model do

  describe "#amount_dollar" do

    it "retunrs 1.0 dollar when amount is 100" do
      charge = FactoryBot.create(:charge, amount: 100)
      expect(charge.amount_dollar).to eq 1.0
    end


    it "retunrs 0.96 dollar when amount is 96" do
      charge = FactoryBot.create(:charge, amount: 96)
      expect(charge.amount_dollar).to eq 0.96
    end

  end
end
