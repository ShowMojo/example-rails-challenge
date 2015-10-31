require 'rails_helper.rb'

describe ChargesController do
  before { get :index }

  it { is_expected.to respond_with(:ok) }
end
