require 'spec_helper'

describe ChargesController do
  let(:charge) { [mock_model(Charge)] }

  describe 'GET index' do
    before(:each) do
      [:failed, :disputed, :successful].each { |method| Charge.stub(method).and_return(charge) }
      get :index
    end

    it { assigns(:charges).should eq({ failed: charge, disputed: charge, successful: charge }) }
    it { should render_template('index') }
    it { response.should be_success }
  end
end

