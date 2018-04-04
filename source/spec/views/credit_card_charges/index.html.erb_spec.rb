require 'rails_helper'

RSpec.describe "credit_card_charges/index", type: :view do
  before do
    assign(:failed, CreditCardCharge.failed)
    assign(:disputed, CreditCardCharge.disputed)
    assign(:successful, CreditCardCharge.successful)
  end
end
