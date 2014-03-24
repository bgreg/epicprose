FactoryGirl.define do
  factory :story do
    title       Faker::Lorem.characters(119)
    picture_url  "www.google.com"
  end
end
