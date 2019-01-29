require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "GET #index" do

    it "disputed charges are included in failed charges" do
      get :index
      failed_charges = assigns(:failed_charges)
      disputed_charges = assigns(:failed_charges)
      expect(disputed_charges.all? { |charge| failed_charges.include?(charge) }).to be true
    end
  end

end
