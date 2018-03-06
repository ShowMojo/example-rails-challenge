require 'rails_helper'

RSpec.describe "credit_card_charges/index", type: :view do
  before do
    assign(:failed, CreditCardCharge.failed)
    assign(:disputed, CreditCardCharge.disputed)
    assign(:successful, CreditCardCharge.successful)
  end

  it 'Verify that there are three lists on the screen' do
    render

    expect(rendered).to match(/table id='failed'/)
    expect(rendered).to match(/table id='disputed'/)
    expect(rendered).to match(/table id='successful'/)
  end
end
