# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/index', type: :view do
  before do
    assign(:customers, 2.times.map { FactoryBot.create(:customer) })
  end

  it 'renders a list of customers' do
    render
    assert_select 'tr>td', text: 'John'.to_s, count: 2
    assert_select 'tr>td', text: 'Doe'.to_s, count: 2
  end
end
