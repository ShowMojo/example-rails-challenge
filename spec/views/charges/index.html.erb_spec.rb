require 'rails_helper'

RSpec.describe 'charges/index', type: :view do
  before(:each) do

    @successful_charges = Charge.where paid: true, refunded: false
    @disputed_charges = Charge.where paid: true, refunded: true
    @failed_charges = Charge.where paid: false
  end

  it 'renders Failed, Disputed and Successful charges' do

    render

    expect(rendered).to have_selector('table#failed-charges', count: 1)

    expect(rendered).to have_selector('table#disputed-charges', count: 1)

    expect(rendered).to have_selector('table#successful-charges', count: 1)
  end

  it 'renders line items in each Charge tables' do

    within('table#successful-charges') do
      expect(page).to have_selector('tbody > tr', count: 10)
    end

    within('table#filed-charges') do
      expect(page).to have_selector('tbody > tr', count: 5)
    end

    within('table#disputed-charges') do
      expect(page).to have_selector('tbody > tr')
    end
  end
end
