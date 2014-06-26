require 'rails_helper'

describe 'charges/index.html.haml' do
  before :all do 
    Rails.application.load_seed # loading seeds: not the best thing to do, but for specfications for the exercise, it is tolerable
    @failed_charges = Charge.failed
    @disputed_charges = Charge.disputed
    @success_charges = Charge.successfull
  end

  it 'has a list of successfull, failed and disputed charges' do
    render
    expect( rendered ).to have_selector( "table.success")
    expect( rendered ).to have_selector( "table.failed")
    expect( rendered ).to have_selector( "table.disputed")
  end

  it 'list of successfull charges got right number of elements' do
    render
    expect(rendered).to have_selector( "table.success tbody tr", count: @success_charges.count)
  end
  it 'list of successfull charges got right number of elements' do
    render
    expect(rendered).to have_selector( "table.failed tbody tr", count: @failed_charges.count)
  end
  it 'list of successfull charges got right number of elements' do
    render
    expect(rendered).to have_selector( "table.disputed tbody tr", count: @disputed_charges.count)
  end
end