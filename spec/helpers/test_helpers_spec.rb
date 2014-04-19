require 'spec_helper'

describe "Test helpers" do
  it "should return a url " do
    ValidString.url.should be_an_instance_of( String )
  end

  it "should return a short string" do 
    ValidString.short.should be_an_instance_of( String )
  end

  it "should return a long string" do
    ValidString.long.should be_an_instance_of( String )
  end

  it "should return a random string" do
    ValidString.random_string(20).should be_an_instance_of( String )
  end
end
