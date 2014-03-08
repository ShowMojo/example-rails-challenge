require 'spec_helper'

describe 'credit_card_charges/index.html.erb' do

  before do
    @customer = FactoryGirl.create(:customer)
    @successful = 10.times {FactoryGirl.create(:successful_charge)}
    @failed = 5.times {FactoryGirl.create(:failed_charge)}
    @disputed = FactoryGirl.create(:disputed_charge)
    render
  end

  it 'should have 3 lists' do
    rendered.should have_selector('#successful')
    rendered.should have_selector('#failed')
    rendered.should have_selector('#disputed')
  end

  it 'should have 10 charges listed as successful' do
    rendered.should have_selector('.s', count:10)
  end

  it 'should have 5 charges listed as failed' do
    rendered.should have_selector('.f', count:5)
  end

  it 'should have a charge listed as disputed' do
    rendered.should have_selector('.d', count:1)
  end
end