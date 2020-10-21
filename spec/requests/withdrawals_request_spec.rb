require 'rails_helper'

RSpec.describe "Withdrawals", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/withdrawals/new"
      expect(response).to have_http_status(:success)
    end
  end

end
