require 'rails_helper'

RSpec.describe "charges/show", :type => :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :paid => false,
      :amount => "9.99",
      :currency => "",
      :refunded => false,
      :customer_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
