require 'rails_helper'

RSpec.describe "charges/index", :type => :view do
  before(:each) do
    assign(:charges, [
      Charge.create!(),
      Charge.create!()
    ])
  end

  it "renders a list of charges" do
    render
  end
end
