require "spec_helper"

describe ChapterMailer do
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

    ChapterMailer.new_chapter_email(@story, @chapter).deliver
  end

  after do
    ActionMailer::Base.deliveries.clear
  end

  it "has a valid story" do
    @story.should be_an_instance_of(Story)
  end

  it "should send an email" do
    ActionMailer::Base.deliveries.count.should == 1
  end

  describe "contents of the email" do
    it 'renders the correct reciever email' do
      ActionMailer::Base.deliveries.first.to.first.should == @player2.email
    end
    it 'renders the correct sender email' do
      ActionMailer::Base.deliveries.first.from.should == ['do-not-reply@epicprose.com']
    end
  end
end
