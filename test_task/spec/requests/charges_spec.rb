require "rails_helper"

describe "charges#index should require" do

  before :each do
    get "/charges"
  end

  it "failed list" do
    assert_select ".failed"
  end
  it "disputed list" do
    assert_select ".disputed"
  end
  it "successful list" do
    assert_select ".successful"
  end
  it "10 successful charge items" do
    assert_select ".successful tbody tr", count: 10
  end
  it "5 failed charge items" do
    assert_select ".failed tbody tr", count: 5
  end
  it "5 disputed charge items" do
    assert_select ".disputed tbody tr", count: 5
  end
end
