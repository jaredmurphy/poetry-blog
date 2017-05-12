require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid without a user" do
    invalid_post = FactoryGirl.build(:post, user_id: nil)
    expect(invalid_post).to_not be_valid
  end

  it "is invalid without a title" do
    invalid_post = FactoryGirl.build(:post, title: nil)
    expect(invalid_post).to_not be_valid
  end

  it "is invalid without a description" do
    invalid_post = FactoryGirl.build(:post, description: nil)
    expect(invalid_post).to_not be_valid
  end

  context "when email is already taken" do
    it "is invalid" do
      valid_user = FactoryGirl.create(:user, email: Faker::Internet.email)
      invalid_user = FactoryGirl.build(:user, email: valid_user.email)

      expect(invalid_user).to_not be_valid
    end
  end
end
