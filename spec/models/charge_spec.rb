require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'associations' do
    it { should belong_to :customer }
  end
  describe 'succeed scope' do
    it 'should return succeed charges' do
      expect(Charge.succeed.to_sql).to eq Charge.where(paid: true, refunded: false).to_sql
    end
  end
  describe 'failed scope' do
    it 'should return failed charges' do
      expect(Charge.failed.to_sql).to eq Charge.where(paid: false).to_sql
    end
  end
  describe 'disputed scope' do
    it 'should return disputed charges' do
      expect(Charge.disputed.to_sql).to eq Charge.where(paid: true, refunded: true).to_sql
    end
  end

end
