require "rails_helper"

RSpec.describe "Charges list", type: :request do
  it "sucessfully opens webpage" do
    get  "/"
    expect(response).to have_http_status(:success)  
  end
end
