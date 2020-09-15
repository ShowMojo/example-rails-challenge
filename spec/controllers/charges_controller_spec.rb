require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  let(:customer) do
    create(:customer)
  end

  let(:valid_attributes) do
    {
      paid: true,
      amount: 99.99,
      currency: 'usd',
      refunded: false,
      customer_id: customer.id
    }
  end

  let(:invalid_attributes) do
    {
      paid: true,
      amount: 99.99,
      currency: 'usd'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ChargesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Charge.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      charge = Charge.create! valid_attributes
      get :show, { id: charge.to_param }, valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, {}, valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      charge = Charge.create! valid_attributes
      get :edit, { id: charge.to_param }, valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Charge' do
        expect do
          post :create, { charge: valid_attributes }, valid_session
        end.to change(Charge, :count).by(1)
      end

      it 'redirects to the created charge' do
        post :create, { charge: valid_attributes }, valid_session
        expect(response).to redirect_to(Charge.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, { charge: invalid_attributes }, valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          refunded: true
        }
      end

      it 'updates the requested charge' do
        charge = Charge.create! valid_attributes
        put :update, { id: charge.to_param, charge: new_attributes }, valid_session
        charge.reload
        expect(charge.refunded).to be_truthy
      end

      it 'redirects to the charge' do
        charge = Charge.create! valid_attributes
        put :update, { id: charge.to_param, charge: valid_attributes }, valid_session
        expect(response).to redirect_to(charge)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested charge' do
      charge = Charge.create! valid_attributes
      expect do
        delete :destroy, { id: charge.to_param }, valid_session
      end.to change(Charge, :count).by(-1)
    end

    it 'redirects to the charges list' do
      charge = Charge.create! valid_attributes
      delete :destroy, { id: charge.to_param }, valid_session
      expect(response).to redirect_to(charges_url)
    end
  end
end
