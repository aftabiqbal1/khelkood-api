require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /register_team" do
    it "returns http success" do
      get "/customers/register_team"
      expect(response).to have_http_status(:success)
    end
  end

end
