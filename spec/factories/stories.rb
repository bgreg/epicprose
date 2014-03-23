# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "MyString"
    picture_url "MyString"
    user_id 1
    genre_id 1
  end
end
