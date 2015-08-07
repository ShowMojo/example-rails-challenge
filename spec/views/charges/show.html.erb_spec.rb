require 'rails_helper'

RSpec.describe "charges/show", :type => :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!(
      :created => 1,
      :paid => false,
      :amount => 1.5,
      :refunded => false,
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
