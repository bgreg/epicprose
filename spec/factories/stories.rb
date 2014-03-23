FactoryGirl.define do
  factory :story do
    title       Faker::Lorem.characters(119)
    picture_url Faker::Internet.url
    user_id     1
    genre_id    1
  end
end
