require 'spec_helper'

describe Story do
  it "should create a new story" do
    story = Story.new(title: "Demo Story", picture_url: "https://www.rubygems.com")
    story.should be_an_instance_of( Story )
  end

  it "should allow 6 chapters to be added" do
    story = Story.new(title: "Demo Story", picture_url: "https://www.rubygems.com")
    chapters = []
    6.times{ chapters << Chapter.create(body: "test") }
    story.chapters = chapters
    story.save
    story.chapters.length.should be(6)
  end

  it "should not save a story with more than 6 chapters" do
    story = Story.new(title: "Demo Story", picture_url: "https://www.rubygems.com")
    chapters = []
    6.times{ chapters << Chapter.create(body: "test") }
    story.chapters = chapters
    story.chapters << Chapter.create(body: "test")

    saved_story = story.save
    saved_story.should be_false
  end

  it "should display an appropriate error message on 7th chapter save attempt" do
    story = Story.new(title: "Demo Story", picture_url: "https://www.rubygems.com")
    chapters = []
    6.times{ chapters << Chapter.create(body: "test") }
    story.chapters = chapters
    story.chapters << Chapter.create(body: "test")

    story.save
    expect(story.errors.messages[:chapter]).to include("Cannot have more than 6 chapters")
  end

  it "should not save without valid title" do
    story_count = Story.count 
    story = Story.new(picture_url: "https://www.rubygems.com")

    saved_story = story.save
    Story.count.should eq(story_count)
  end

  it "should not save without a picutre_url" do
    story_count = Story.count 
    story = Story.new(title: "test" )

    saved_story = story.save
    Story.count.should eq(story_count)
  end

  it "should not validate mal-formed url" do
    story_count = Story.count 
    story = Story.new( title: "test", picture_url: "test" )

    saved_story = story.save
    Story.count.should eq(story_count)
  end

  it "should allow a valid url" do 
    story_count = Story.count 
    story = Story.new( title: "test", picture_url: "https://www.rubygems.com" )

    saved_story = story.save
    Story.count.should eq(story_count + 1)
  end

  it "should return a validation message on malformed urls" do 
    story_count = Story.count 
    story = Story.new( title: "test", picture_url: "rubygemscom" )
    story.save
    expect(story.errors.messages[:picture_url]).to include("Valid URL is required")
  end

  it "should not allow titles shorter than 2 characters" do 
    story_count = Story.count 
    story = Story.new(title: "1", picture_url: "https://www.rubygems.com")

    saved_story = story.save
    Story.count.should eq(story_count)
  end
  it "should not allow titles greater than 120 characters" do 
    story_count = Story.count 
    story = Story.new(
         title: "Integer posuere erat a ante venenatis dapibus posuere velit 
          aliquet. Integer posuere erat a ante venenatis dapibus posuere velit 
          aliquet. Eti",
         picture_url: "https://www.rubygems.com")

    saved_story = story.save
    Story.count.should eq(story_count)
  end

  it "should allow titles less than 120 characters and greater than 2" do 
    story_count = Story.count 
    story = Story.new(
         title: "erat a ante venenatis dapibus posuere velit aliquet." + 
           "Integer posuere erat a ante venenatis dapibus posuere velit",
         picture_url: "https://www.rubygems.com")
    saved_story = story.save
    Story.count.should eq(story_count + 1)
  end

end
