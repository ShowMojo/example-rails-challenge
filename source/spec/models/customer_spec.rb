# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { expect(FactoryBot.create(:customer)).to respond_to(:credit_card_charges) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(FactoryBot.build(:customer)).to be_valid
    end

    it 'is not valid without attributes' do
      expect(Customer.new).to be_invalid
    end

    it 'is not valid without a first_name' do
      expect(Customer.new(last_name: 'Doe')).to be_invalid
    end

    it 'is not valid without a last_name' do
      expect(Customer.new(first_name: 'John')).to be_invalid
    end

    it 'is correctly returns full name' do
      expect(FactoryBot.build(:customer).full_name).to eq('John Doe')
    end
  end
end
