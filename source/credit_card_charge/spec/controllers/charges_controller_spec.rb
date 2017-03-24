# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let(:customer_01) { create(:customer) }
  let(:customer_02) { create(:customer) }
  let(:customer_03) { create(:customer) }

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'verifies three different charge listings' do
      failed_charge = create(:charge, paid: false, refunded: false, customer: customer_01)
      disputed_charge = create(:charge, paid: true, refunded: true, customer: customer_02)
      successful_charge = create(:charge, paid: true, refunded: false, customer: customer_03)

      get :index

      expect(assigns(:failed_charges)).to eq([failed_charge])
      expect(assigns(:disputed_charges)).to eq([disputed_charge])
      expect(assigns(:successful_charges)).to eq([successful_charge])
    end

    it 'verifies ten successful charges in a list' do
      successful_charges = create_list(:charge, 10, paid: true, refunded: false, customer: customer_01)

      get :index
      expect(successful_charges.count).to be(10)
      expect(successful_charges.first.customer).to_not be_nil
      expect(successful_charges.first.paid).to be(true)
      expect(successful_charges.first.refunded).to be(false)
    end

    it 'verifies 5 failed charges in a list' do
      failed_charges = create_list(:charge, 5, paid: false, refunded: false, customer: customer_02)

      get :index
      expect(failed_charges.count).to be(5)
      expect(failed_charges.first.customer).to_not be_nil
      expect(failed_charges.first.paid).to be(false)
      expect(failed_charges.first.refunded).to be(false)
    end

    it 'verifies 5 disputed charges in a list' do
      failed_charges = create_list(:charge, 5, paid: true, refunded: true, customer: customer_03)

      get :index
      expect(failed_charges.count).to be(5)
      expect(failed_charges.first.customer).to_not be_nil
      expect(failed_charges.first.paid).to be(true)
      expect(failed_charges.first.refunded).to be(true)
    end
  end
end
