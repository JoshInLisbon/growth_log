require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  subject(:http_request) { post user_registration_path, params: user_params }
  let(:user_params) do
    {
      user: {
        email: 'user@growthlog.io',
        username: 'zippy',
        password: 'password123',
        password_confirmation: 'password123',
      },
    }
  end

  describe "POST /users/sign_up" do
    it "creates a user" do
      expect { http_request }.to change(User, :count).by(1)
    end

    it "redirects to the user's page" do
      expect(http_request).to redirect_to(user_path(User.last))
    end

    describe 'status code' do
      subject(:http_response) { post user_registration_path, params: user_params; response }
a
      it { is_expected.to have_http_status(:found) }
    end
  end
end
