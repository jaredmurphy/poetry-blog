FactoryGirl.define do
  factory :post do
    title Faker::Book.title
    description Faker::Lorem.sentence
    image_url Faker::Placeholdit.image
    association :user, factory: :user
  end
end
