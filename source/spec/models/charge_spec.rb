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


end
