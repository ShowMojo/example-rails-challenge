# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'credit_card_charges/show', type: :view do
  before do
    @credit_card_charge = assign(:credit_card_charge, FactoryBot.create(:credit_card_charge, :successful))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3500/)
    expect(rendered).to match(/#{CreditCardCharge::DEFAULT_CURRENCY}/)
    expect(rendered).to match(/false/)
  end
end
