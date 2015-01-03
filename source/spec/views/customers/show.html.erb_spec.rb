require 'rails_helper'

RSpec.describe "customers/show", :type => :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :first_name => "",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Last Name/)
  end
end
