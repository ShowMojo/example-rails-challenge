require "rails_helper"

feature "Items list by status" do
  before { visit charges_path }

  it_behaves_like "List with charges", :failed, 5
  it_behaves_like "List with charges", :disputed, 5
  it_behaves_like "List with charges", :success, 10
end
