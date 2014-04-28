class ChaptersController < ApplicationController
  before_action :set_chapter,  only:  [ :show, :edit  ]

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new( chapter_params )
    story = Story.find( params[:story_id] )

    @chapter.user = current_user
    story.chapters << @chapter
    story.turn = get_other_user( current_user, story )

    respond_to do |format|
      if @chapter.save && story.save
        ChapterMailer.new_chapter_email( story, @chapter ).deliver
        format.html { redirect_to story_path( story.id ),
                      notice: 'Chapter was successfully created.' }
        format.json { render action: 'show',
                      status: :created, location: [ :story, @chapter ] }
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def chapter_params
    params.require( :chapter ).permit( :body )
  end

  def set_chapter
    @chapter = Story.find( params[:story_id]).chapters.find(params[:id] )
  end

  def get_other_user( user, story )
    role = StoryRole.where( "story_id = :story_id AND user_id != :user_id",
                          { story_id: story.id, user_id: user.id} ).first
    role.user.id.to_i
  end
end
