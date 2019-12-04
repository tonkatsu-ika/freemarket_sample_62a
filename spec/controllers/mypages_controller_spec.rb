require 'rails_helper'

RSpec.describe MypageController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #card" do
    it "returns http success" do
      get :card
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #identification" do
    it "returns http success" do
      get :identification
      expect(response).to have_http_status(:success)
    end
  end

end
