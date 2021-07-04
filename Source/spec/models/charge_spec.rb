require 'rails_helper'

RSpec.describe Charge, type: :model do
  it { is_expected.to belong_to(:customer) }

  it 'returns a scope of successful charges' do
    charges = FactoryBot.create_list(:charge, 10, :successful)
    expect(charges.size).to eq(Charge.successful.size)
  end

  it 'returns a scope of failed charges' do
    charges = FactoryBot.create_list(:charge, 10, :failed)
    expect(charges.size).to eq(Charge.failed.size)
  end

  it 'returns a scope of disputed charges' do
    charges = FactoryBot.create_list(:charge, 10, :disputed)
    expect(charges.size).to eq(Charge.disputed.size)
  end
end