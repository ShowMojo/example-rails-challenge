require 'rails_helper'

RSpec.describe "charges/show", type: :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :paid => false,
      :amount => 2,
      :currency => "Currency",
      :refunded => false,
      :customer => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
