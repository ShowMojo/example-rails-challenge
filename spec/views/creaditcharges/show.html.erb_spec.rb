require 'rails_helper'

RSpec.describe "creaditcharges/show", type: :view do
  before(:each) do
    @creaditcharge = assign(:creaditcharge, Creaditcharge.create!(
      :paid => false,
      :amount => 1,
      :currency => "Currency",
      :refunded => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Currency/)
    expect(rendered).to match(//)
  end
end
