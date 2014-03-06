require 'spec_helper'

describe "charges/show" do
  before(:each) do
    @charge = assign(:charge, stub_model(Charge,
      :paid => false,
      :amount => 1,
      :currency => "Currency",
      :refunded => false,
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(/Currency/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
