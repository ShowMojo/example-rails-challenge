# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { create(:customer) }

  it 'has a valid factory' do
    expect(build(:customer)).to be_valid
  end

  describe 'ActiveRecord associations' do
    it { is_expected.to have_many :charges }
  end
end
