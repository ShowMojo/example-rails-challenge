require 'rails_helper'

RSpec.describe "charges/show", :type => :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
