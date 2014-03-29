FactoryGirl.define do
  factory :story do
    title       Faker::Lorem.characters(119)
    picture_url Faker::Internet.url
    category
  end

  factory :category do
    body "test"
  end


end
