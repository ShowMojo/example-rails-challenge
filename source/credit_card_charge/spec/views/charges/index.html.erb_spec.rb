require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:failed_charges, Charge.failed_charges)
    assign(:disputed_charges, Charge.disputed_charges)
    assign(:successful_charges, Charge.successful_charges)
  end

  it 'renders lists of failed, displuted and successful charges' do
    render

    assert_select 'table.failed', count: 1
    assert_select 'table.failed tbody tr', count: 5

    assert_select 'table.disputed', count: 1
    assert_select 'table.disputed tbody tr', count: 5

    assert_select 'table.successful', count: 1
    assert_select 'table.successful tbody tr', count: 10
  end
end
