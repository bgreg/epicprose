require "spec_helper"

describe ChapterMailer do
  before do
    @story = create(:story)
    @author = create(:user)
    @co_author = create(:user)
    ChapterMailer.new_chapter_email(@author,@co_author,@story, @chapter).deliver
  end
  after do
    ActionMailer::Base.deliveries.clear
  end
  it "should send an email" do
    ActionMailer::Base.deliveries.count.should == 1
  end

  describe "contents of the email" do
    it 'renders the correct reciever email' do
      ActionMailer::Base.deliveries.first.to.first.should == @sales_person
    end
    it 'renders the correct sender email' do
      ActionMailer::Base.deliveries.first.from.should == ['do-not-reply@vorstack.com']
    end
    it 'renders the content of the chapter' do 
      ActionMailer::Base.deliveries.first.inspect
    end
  end
end
