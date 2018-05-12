require 'rails_helper'

RSpec.describe Charge, type: :model do
  let(:charge) { build :charge }

  describe "amount" do
    it { expect(charge).to respond_to(:amount) }
    it { expect(charge).to have_db_column(:amount) }
  end

  describe "currency" do
    it { expect(charge).to respond_to(:currency) }
    it { expect(charge).to have_db_column(:currency) }
  end

  describe "paid" do
    it { expect(charge).to respond_to(:paid) }
    it { expect(charge).to have_db_column(:paid) }
  end

  describe "refunded" do
    it { expect(charge).to respond_to(:refunded) }
    it { expect(charge).to have_db_column(:refunded) }
  end

  describe "customer" do
    it { expect(charge).to respond_to(:customer_id) }
    it { expect(charge).to have_db_column(:customer_id) }
    it { expect(charge).to belong_to(:customer) }
  end

  describe "scope" do
    let!(:successful_charges) { create_list :charge, 5, :successful }
    let!(:failed_charges) { create_list :charge, 3, :failed }
    let!(:disputed_charges) { create_list :charge, 10, :disputed }
    describe "#successful" do
      it "returns successful charges" do
        expect(Charge.successful).to match_array successful_charges
      end
    end
    describe "#failed" do
      it "returns failed charges" do
        expect(Charge.failed).to match_array failed_charges
      end
    end
    describe "#disputed" do
      it "returns disputed charges" do
        expect(Charge.disputed).to match_array disputed_charges
      end
    end
  end


end
