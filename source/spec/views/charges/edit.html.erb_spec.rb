require 'rails_helper'

RSpec.describe "charges/edit", :type => :view do
  before(:each) do
    @charge = assign(:charge, Charge.create!())
  end

  it "renders the edit charge form" do
    render

    assert_select "form[action=?][method=?]", charge_path(@charge), "post" do
    end
  end
end
