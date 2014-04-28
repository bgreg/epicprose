require 'spec_helper'

describe User do
  it "should allow getting a friends list" do 
    @user = User.create( email: Faker::Internet.email, password: Faker::Lorem.characters(10))
    friends =  @user.get_friends
    friends.should be_an_instance_of( Array )
  end
  it "should get a list of friends if stories are started" do 
    user = User.create( email: Faker::Internet.email, password: Faker::Lorem.characters(10))
    user1_email = Faker::Internet.email
    user1 = User.create( email: user1_email, password: Faker::Lorem.characters(10))

    story = Story.create(title: "Demo Story", picture_url: "https://www.rubygems.com")
    user.stories << story
    user1.stories << story

    friends =  user.get_friends
    friends.should include( user1_email )
  end
end
