FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password    "dadadasdfasdfasdfasfa"
    password_confirmation    "dadadasdfasdfasdfasfa"
  end
end
