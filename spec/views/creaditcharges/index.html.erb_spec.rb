require 'rails_helper'

RSpec.describe "creaditcharges/index", type: :view do
#   before(:each) do
#     assign(:creaditcharges, [
#       Creaditcharge.create!(
#         :paid => false,
#         :amount => 1,
#         :currency => "Currency",
#         :refunded => ""
#       ),
#       Creaditcharge.create!(
#         :paid => false,
#         :amount => 1,
#         :currency => "Currency",
#         :refunded => ""
#       )
#     ])
#   end

  it "renders a list of creaditcharges" do
    render
    assert_select "body>h1", :count => 3
    assert_select "div.failed", :count => Creaditcharge.failed.count
  end
end
