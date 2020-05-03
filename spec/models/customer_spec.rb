require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'validations' do
    describe 'it validates name' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end
  end

  describe "Associations" do
    it { should have_many(:charges).dependent(:destroy) }
  end

  describe "name" do
    let(:customer) { Customer.new(first_name: "Raj", last_name: "Jamnis") }

    it "returns customer first name" do
      expect( customer.first_name ).to eq("Raj")
    end

    it "returns customer last name" do
      expect( customer.last_name ).to eq("Jamnis")
    end
  end

end
