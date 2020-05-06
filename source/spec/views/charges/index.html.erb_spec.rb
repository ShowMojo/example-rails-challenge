require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:charges, [FactoryBot.create(:charge),FactoryBot.create(:charge)])
  end

  it "renders a list of charges" do
    render
    # assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
