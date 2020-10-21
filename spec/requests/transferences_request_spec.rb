require 'rails_helper'

RSpec.describe "Transferences", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/transferences/new"
      expect(response).to have_http_status(:success)
    end
  end

end
