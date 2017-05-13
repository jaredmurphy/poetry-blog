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

  context "when title is already taken" do
    it "is invalid" do
      valid_post = FactoryGirl.create(:post)
      invalid_post = FactoryGirl.build(:post, title: valid_post.title)

      expect(invalid_post).to_not be_valid
    end
  end
end
