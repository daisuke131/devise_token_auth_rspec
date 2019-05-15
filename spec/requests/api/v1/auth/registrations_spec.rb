require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST /api/v1/auth" do
    subject { post(api_v1_user_registration_path, params: params) }
    let(:params) { attributes_for(:user) }
    it "ユーザー登録できる" do
      subject
      res = JSON.parse(response.body)
      expect(res["status"]).to eq("success")
      expect(res["data"]["id"]).to eq(User.last.id)
      expect(res["data"]["email"]).to eq(User.last.email)
      expect(response).to have_http_status(200)
    end
  end
end