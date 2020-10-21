require 'rails_helper'

RSpec.describe "BankStatements", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/bank_statement/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/bank_statement/index"
      expect(response).to have_http_status(:success)
    end
  end

end
