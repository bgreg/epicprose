class ChapterMailer <  AsyncMailer
  default from: "do-not-reply@epicprose.com"
  def new_chapter_email( story, chapter )
    @story = story
    @chapter = chapter
    @user = User.find( @story.turn )

    mail( to: @user.email, subject: "New Chapter created for #{@story.title}")
  end
end
