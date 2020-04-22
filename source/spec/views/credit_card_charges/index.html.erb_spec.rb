# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'credit_card_charges/index', type: :view do
  before do
    assign(:cc_successful_charges, 10.times.map { FactoryBot.create(:credit_card_charge, :successful) })
    assign(:cc_disputed_charges, 15.times.map { FactoryBot.create(:credit_card_charge, :disputed) })
    assign(:cc_failed_charges, 5.times.map { FactoryBot.create(:credit_card_charge, :failed) })
  end

  it 'renders a three list of credit_card_charges' do
    render
    assert_select 'h2', text: 'Failed Charges', count: 1
    assert_select 'h2', text: 'Disputed Charges', count: 1
    assert_select 'h2', text: 'Successful Charges', count: 1
  end

  it 'render ten successfull charges' do
    render
    assert_select 'li.charge-successful', count: 10
  end

  it 'render five failed charges' do
    render
    assert_select 'li.charge-failed', count: 5
  end

  it 'render disputed charges' do
    render
    assert_select 'li.charge-disputed', count: 15
  end
end
