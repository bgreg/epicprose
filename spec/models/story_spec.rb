require 'spec_helper'

describe Story do
  describe "With Valid parameters" do 
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

    it "should save with a valid url" do 
      expect{
        story = Story.new( title: "test", picture_url: "https://www.rubygems.com" )
        story.save
      }.to change(Story, :count).by(1)
    end

    it "should allow titles less than 120 characters and greater than 2" do 
      expect{
        story = Story.new( title: ValidString.short, picture_url: "https://www.rubygems.com")
        story.save
      }.to change(Story, :count).by(1)
    end
  end

  describe "With invalid params" do
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
      expect{
        story = Story.new(picture_url: "https://www.rubygems.com")
        story.save
      }.to change(Story, :count).by(0)
    end

    it "should not allow titles shorter than 2 characters" do 
      expect{
        story = Story.new(title: "1", picture_url: "https://www.rubygems.com")
        story.save
      }.to change(Story, :count).by(0)
    end

    it "should not allow titles greater than 120 characters" do 
      expect{ 
        story = Story.new( title: ValidString.long, picture_url: "https://www.rubygems.com")
        story.save
      }.to change(Story, :count).by(0)
    end
  end
end
