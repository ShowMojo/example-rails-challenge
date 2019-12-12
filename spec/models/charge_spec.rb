require 'rails_helper'

RSpec.describe Charge, type: :model do
  it "has 10 successful charges" do
    s_charges = Charge.succeed
    
    expect(s_charges.length).to eq(10)
  end

  it "has 5 failed charges" do
    f_charges = Charge.failed
    
    expect(f_charges.length).to eq(5)
  end

  it "has disputed charges" do
    d_charges = Charge.disputed
    
    expect(d_charges.length).to > 0
  end
end
