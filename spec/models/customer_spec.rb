require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject {
    described_class.new(first_name: "John", last_name: "Doe")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without first_name" do
    subject.first_name = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without last_name" do
    subject.last_name = nil

    expect(subject).to_not be_valid
  end

  it "is has many charges association" do
    expect(described_class.reflect_on_association(:charges).macro).to eq(:has_many)
  end
end
