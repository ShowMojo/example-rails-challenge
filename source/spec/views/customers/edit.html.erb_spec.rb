# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/edit', type: :view do
  before do
    @customer = assign(:customer, FactoryBot.create(:customer))
  end

  it 'renders the edit customer form' do
    render

    assert_select 'form[action=?][method=?]', customer_path(@customer), 'post' do
      assert_select 'input#customer_first_name[name=?]', 'customer[first_name]'
      assert_select 'input#customer_last_name[name=?]', 'customer[last_name]'
    end
  end
end
