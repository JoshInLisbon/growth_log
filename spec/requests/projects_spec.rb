require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects/new" do
    it "returns http success" do
      get "/projects/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    pending "returns http success" do
      get "/projects/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /projects" do
    it "returns http success" do
      get "/projects"
      expect(response).to have_http_status(:success)
    end
  end

end
