require 'spec_helper'

describe Story do
  before :all do
    @story = Story.new
  end

  it "should create a new story" do
    @story.should be_an_instance_of( Story )
  end
end
