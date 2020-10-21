require 'rails_helper'

RSpec.describe "Deposits", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/deposits/new"
      expect(response).to have_http_status(:success)
    end
  end

end
