# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/show', type: :view do
  before do
    @customer = assign(:customer, FactoryBot.create(:customer))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First name/)
    expect(rendered).to match(/Last name/)
  end
end
