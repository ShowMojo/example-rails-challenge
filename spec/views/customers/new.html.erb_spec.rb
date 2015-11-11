require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :firstname => "MyString",
      :lastname => "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_firstname[name=?]", "customer[firstname]"

      assert_select "input#customer_lastname[name=?]", "customer[lastname]"
    end
  end
end
