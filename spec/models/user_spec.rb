require 'spec_helper'

describe User do
  describe ".find_or_create_by_hash" do
    context "when it's a new user" do
      it "should create a new user" do
        expect { User.find_or_create_by_hash(OmniAuth.config.mock_auth[:facebook]) }.to change{User.count}.by(1)
      end
    end
    context "when it's a returning user" do
      before { User.create :uid => "536687842" }
      it "should not create a new user" do
        expect { User.find_or_create_by_hash(OmniAuth.config.mock_auth[:facebook]) }.to_not change{User.count}.by(1)
      end
      it "should return the persisted user" do
        User.find_or_create_by_hash(OmniAuth.config.mock_auth[:facebook]).should be_persisted
      end
    end
  end
end
