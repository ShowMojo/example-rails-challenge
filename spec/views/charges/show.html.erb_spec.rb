require 'rails_helper'

RSpec.describe "charges/show", type: :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :customer => nil,
      :paid => false,
      :amount => 2.5,
      :currency => "Currency",
      :refunded => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(/false/)
  end
end
