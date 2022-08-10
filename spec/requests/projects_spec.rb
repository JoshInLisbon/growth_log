require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "POST /create" do
    subject(:http_request) { post projects_path, params: project_params }

    let(:project_params) do
      {
        project: {
          name: 'cool money maker',
          description: 'get rich quick',
          url: 'https://donald-duck.net'
        }
      }
    end

    before do
      sign_in create(:user)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "creates a project" do
      expect { http_request }.to change(Project, :count).by(1)
    end
  end

  describe "GET /projects" do
    it "returns http success" do
      get "/projects"
      expect(response).to have_http_status(:success)
    end
  end

end
