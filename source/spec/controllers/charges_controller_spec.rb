require 'rails_helper'

describe ChargesController, type: :controller do
  describe 'GET index' do
    before do
      create_list(:charge, 3, :successful)
      create_list(:charge, 2, :failed)
      create_list(:charge, 2, :disputed)
      get :index
    end

    it 'assigns successful charges to @successful_charges' do
      expect(assigns(:successful_charges)).to eq(Charge.successful)
    end

    it 'assigns failed charges to @failed_charges' do
      expect(assigns(:failed_charges)).to eq(Charge.failed)
    end

    it 'assigns disputed charges to @disputed_charges' do
      expect(assigns(:disputed_charges)).to eq(Charge.disputed)
    end
  end
end
