require 'rails_helper'

RSpec.describe Charge, type: :model do
  it "has 10 successful charges" do
    expect(Charge.successful.size).to eq(10)
  end

  it "has 5 failed charges" do
    expect(Charge.failed.size).to eq(5)
  end

  it "has disputed charges" do
    expect(Charge.disputed.size).to be > 0
  end
end
