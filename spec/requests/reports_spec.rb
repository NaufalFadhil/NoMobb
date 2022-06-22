require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/reports/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/reports/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/reports/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/reports/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
