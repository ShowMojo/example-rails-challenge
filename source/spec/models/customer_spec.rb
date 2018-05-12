require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { build :customer }

  describe "first_name" do
    it { expect(customer).to respond_to(:first_name) }
    it { expect(customer).to have_db_column(:first_name) }
  end

  describe "last_name" do
    it { expect(customer).to respond_to(:last_name) }
    it { expect(customer).to have_db_column(:last_name) }
  end

  it { expect(customer).to have_many(:charges) }

  describe "name" do
    it "returns first_name and last_name" do
      expect(customer.name).to eq customer.first_name + " " + customer.last_name
    end
  end
end
