require 'rails_helper'

RSpec.describe 'charges/index' do
  before(:each) do
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @succeed_charges = Charge.succeed
    render
  end
  context 'there are three lists' do
    it 'displays successful charges' do
      response.should have_selector('h2', text: 'Successful Charges')
    end
    it 'displays failed charges' do
      response.should have_selector('h2', text: 'Failed Charges')
    end
    it 'displays disputed charges' do
      response.should have_selector('h2', text: 'Disputed Charges')
    end
  end

  context 'verify charges list' do
    it '10 successful charges' do
      response.should have_selector('table.succeed tr', count: 10)
    end

    it '5 failed charges' do
      response.should have_selector('table.failed tr', count: 5)
    end

    it '5 disputed charges' do
      response.should have_selector('table.disputed tr', count: 5)
    end
  end
end
