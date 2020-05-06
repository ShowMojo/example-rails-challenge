require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:customer) { Customer.create(first_name: "John", last_name: "Doe") }

  let(:attributes) {
    {
      amount: 1000,
      customer: customer,
      created: Time.now,
      status: :successful
    }
  }

  subject {
    described_class.create(attributes)
  }

  describe "attributes validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without amount" do
      subject.amount = nil

      expect(subject).to_not be_valid
    end

    it "is not valid without created" do
      subject.created = nil

      expect(subject).to_not be_valid
    end

    it "is has belongs_to customer association" do
      expect(described_class.reflect_on_association(:customer).macro).to eq(:belongs_to)
    end
  end

  describe "#status enumerations" do
    let(:status) { [:successful, :failed, :disputed] }

    it "has the right index" do
      status.each_with_index do |item, index|
        expect(described_class.statuses[item]).to eq index
      end
    end
  end
end
