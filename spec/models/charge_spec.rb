require 'rails_helper'

RSpec.describe Charge, type: :model do

  let(:customer) { FactoryBot.create :customer }
  let(:charge_hash)  { {currency: Charge::currencies['usd'], amount: rand(100..300)} }

 
  describe "Validations" do
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:amount) }
    it { should define_enum_for(:currency).with([:usd, :inr, :eur, :gbp]) }
  end

end
