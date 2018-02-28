require 'rails_helper'

RSpec.describe CreditCardCharge, type: :model do
  it 'Verify that Successful count equal 10' do
    expect(CreditCardCharge.successful.count).to equal 10
  end

  it 'Verify that Failed count equal 5' do
    expect(CreditCardCharge.failed.count).to equal 5
  end

  it 'Verify that Failed count equal Disputed count' do
    expect(CreditCardCharge.failed.count).to equal CreditCardCharge.disputed.count
  end
end
