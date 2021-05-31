require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChargeHelper. For example:
#
# describe ChargeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ChargeHelper, type: :helper do
  let(:customer) { FactoryBot.create :customer, first_name: "John", last_name: "Doe" }
  let(:charge) { FactoryBot.create :charge,
                 customer: customer,
                 amount: 10051,
                 created: "2021-05-31 15:50:15" }

  specify { expect(customer_full_name(charge)).to eq "John Doe" }
  specify { expect(created(charge)).to eq "May 31, 2021 Mon" }
  specify { expect(amount(charge)).to eq "$100.51" }
  specify { expect(li(charge)).to eq "John Doe, $100.51, May 31, 2021 Mon" }
end
