require 'rails_helper'

RSpec.describe "Petsitters", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/petsitters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/petsitters/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/petsitters/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/petsitters/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
