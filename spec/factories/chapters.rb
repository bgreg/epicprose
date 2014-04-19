# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chapter do
    body Faker::Lorem.characters(119)
  end
end
