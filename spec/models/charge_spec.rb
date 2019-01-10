require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe '#failed!' do
    it 'marks charge as failed' do
      charge = create(:charge, status: :successful)

      charge.failed!

      expect(charge).to be_failed
    end

    it 'records time of failure' do
      charge = create(:charge, status: :successful, failed_at: nil)

      charge.failed!

      expect(charge.failed_at).not_to be_nil
    end
  end

  describe '#disputed!' do
    it 'marks charge as disputed' do
      charge = create(:charge, status: :successful)

      charge.disputed!

      expect(charge).to be_disputed
    end

    it 'records time of dispute' do
      charge = create(:charge, status: :successful, disputed_at: nil)

      charge.disputed!

      expect(charge.disputed_at).not_to be_nil
    end
  end

  describe '#successful!' do
    it 'marks charge as successful' do
      charge = create(:charge, status: :failed)

      charge.successful!

      expect(charge).to be_successful
    end

    it 'records time of successful' do
      charge = create(:charge, status: :failed)

      charge.successful!

      expect(charge.successful_at).not_to be_nil
    end
  end
end
