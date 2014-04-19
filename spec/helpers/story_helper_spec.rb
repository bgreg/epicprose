require 'spec_helper'

describe StoriesHelper do
  before do
    @story = Story.create(title: "Superman")
    @chapter = create(:chapter)
    @player1 = create(:user)
    @player2 = create(:user)

    @story.turn = @player2.id
    @story.users << @player1
    @story.users << @player2

    s = StoryRole.where( story_id: @story.id, user_id: @player1.id ).first
    s.role = :author
    s.save

    s = StoryRole.where( story_id: @story.id, user_id: @player2.id ).first
    s.role = :co_author
    s.save
  end

  it "can return a co author" do
    co_author = get_co_author( @story.id )
    co_author.should eq(@player2.email)
  end

  it "can return an author" do 
    author = get_author( @story.id )
    author.should eq( @player1.email )
  end
end
