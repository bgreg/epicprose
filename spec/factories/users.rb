FactoryGirl.define do
  sequence :email do |n|
    "#{Guid.new.to_s}-email#{n}@gmail.com"
  end

  factory :user do
    email
    password    "dasdfasdfasdfasfa"
    password_confirmation    "dasdfasdfasdfasfa"
  end
end
