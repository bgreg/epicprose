class ChapterMailer <  AsyncMailer
  default from: "from@example.com"
  def new_chapter_email( author, co_author, story, chapter )
    # data goes to mail view
    @author = author
    @co_author = co_author
    @story = story
    @chapter = chapter
    mail( to: @user.email, subject: "New Chapter created for #{@story.title}")
  end
end
