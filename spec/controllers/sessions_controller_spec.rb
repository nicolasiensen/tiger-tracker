# coding: utf-8
require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    before { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] }

    it "should call Authorization.find_or_create_by_hash" do
      User.should_receive(:find_or_create_by_hash).with(request.env["omniauth.auth"]).and_return mock_model(User, :uid => "536687842")
      User.should_receive(:find_by_uid).with("536687842").and_return mock_model(User, :first_name => "Nícolas")
      post :create
    end

    it "should redirect to root" do
      post :create
      response.should redirect_to(root_path)
    end

    it "should keep user in session" do
      post :create
      session[:uid].should be_== "536687842"
    end
  end
end
