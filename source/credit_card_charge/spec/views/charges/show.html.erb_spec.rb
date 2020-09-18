require 'rails_helper'

RSpec.describe "charges/show", type: :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :created => 2,
      :paid => false,
      :amount => 3,
      :currency => "Currency",
      :refunded => false,
      :customer_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
  end
end
