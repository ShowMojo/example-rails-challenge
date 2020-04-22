# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'credit_card_charges/edit', type: :view do
  before do
    @credit_card_charge = assign(:credit_card_charge, FactoryBot.create(:credit_card_charge, :successful))
  end

  it 'renders the edit credit_card_charge form' do
    render

    assert_select 'form[action=?][method=?]', credit_card_charge_path(@credit_card_charge), 'post' do
      assert_select 'input#credit_card_charge_paid[name=?]', 'credit_card_charge[paid]'
      assert_select 'input#credit_card_charge_amount[name=?]', 'credit_card_charge[amount]'
      assert_select 'input#credit_card_charge_currency[name=?]', 'credit_card_charge[currency]'
      assert_select 'input#credit_card_charge_refunded[name=?]', 'credit_card_charge[refunded]'
      assert_select 'input#credit_card_charge_customer_id[name=?]', 'credit_card_charge[customer_id]'
    end
  end
end
