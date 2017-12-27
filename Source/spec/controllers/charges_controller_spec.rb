require 'rails_helper'

RSpec.describe ChargesController,type: :controller do
  describe 'GET index' do
    before do
      FactoryBot.create_list(:charge, 4, :successful)
      FactoryBot.create_list(:charge, 3, :disputed)
      FactoryBot.create_list(:charge, 2, :failed)
      get :index
    end

    it 'assigns successful charges to @successful' do
      expect(assigns(:successful)).to eq(Charge.successful)
    end

    it 'assigns failed charges to @failed' do
      expect(assigns(:failed)).to eq(Charge.failed)
    end

    it 'assigns disputed charges to @disputed' do
      expect(assigns(:disputed)).to eq(Charge.disputed)
    end
  end
end