require 'rails_helper'

RSpec.feature "Charges", type: :feature do
  #before do
  #  visit charges_path
  #end

  it "can be visited" do
    visit charges_path
  end
end
