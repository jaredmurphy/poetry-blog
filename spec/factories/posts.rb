FactoryGirl.define do
  factory :post do
    title Faker::Book.title
    description Faker::Lorem.sentence
    image_url Faker::Placeholdit.image
    user_id 1
  end
end
