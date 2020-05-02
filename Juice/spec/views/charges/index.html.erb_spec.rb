require 'rails_helper'

RSpec.describe "charges/index", type: :view do
  before(:each) do
    assign(:successful_charges, Charge.successful)
    assign(:failed_charges, Charge.failed)
    assign(:disputed_charges, Charge.failed.or(Charge.disputed))
  end

  it "renders 3 lists of charges" do
    render
    assert_select 'ul', count: 3
  end

  it "renders 1 list of successful charges" do
    render
    assert_select 'ul.successful-list', count: 1
  end

  it "renders 1 list of disputed charges" do
    render
    assert_select 'ul.disputed-list', count: 1
  end

  it "renders 1 list of failed charges" do
    render
    assert_select 'ul.failed-list', count: 1
  end

  it "renders 10 items in successful charges" do
    render
    assert_select "ul.successful-list>li", count: 10
  end

  it "renders 5 items in failed charges" do
    render
    assert_select "ul.failed-list>li", count: 5
  end

  it "renders disputed charges with failed charges" do
    render
    assert_select "ul.disputed-list>li" do |items|
      disputed_ids = items.map { |i| i["id"].to_i }
      expect(disputed_ids).to include(*Charge.failed.pluck(:id))
    end
  end
end
