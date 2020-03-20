require 'rails_helper'

describe Charge, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:amount)    }
  it { is_expected.to validate_presence_of(:customer)  }
end

describe Charge, 'delegations', type: :model do
  it { is_expected.to delegate_method(:name).to(:customer).with_prefix(true) }
end

describe Charge, 'associations', type: :model do
  it { is_expected.to belong_to(:customer) }
end

describe Charge, 'Scope', type: :model do
  it 'returns all paid charges', '.successful' do
    expect(Charge.successful.count).to eq 10
    expect(Charge.successful.pluck(:paid).uniq).to     eq [true]
    expect(Charge.successful.pluck(:refunded).uniq).to eq [false]
  end

  it 'returns all failed charges', '.failed' do
    expect(Charge.failed.count).to eq 5
    expect(Charge.failed.pluck(:paid).uniq).to     eq [false]
    expect(Charge.failed.pluck(:refunded).uniq).to eq [false]
  end

  it 'returns all disputed charges', '.disputed' do
    expect(Charge.disputed.count).to eq 5
    expect(Charge.disputed.pluck(:paid).uniq).to     eq [true]
    expect(Charge.disputed.pluck(:refunded).uniq).to eq [true]
  end
end

