class ChaptersController < ApplicationController
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy]
  before_action :set_chapters, only: [:index]

  def index
  end

  def show
  end

  def new
    @chapter = Chapter.new
  end

  def edit
  end

  def create
    @chapter = Chapter.new(chapter_params)
    story = Story.find( params[:story_id] )
    @chapter.user = current_user
    story.chapters << @chapter

    respond_to do |format|
      if @chapter.save && story.save
        format.html { redirect_to story_path(story.id),
                      notice: 'Chapter was successfully created.' }
        format.json { render action: 'show',
                      status: :created, location: [:story,@chapter]}
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to story_path(params[:story_id])}
      format.json { head :no_content }
    end
  end

private
    def set_chapter
      @chapter = Story.find(params[:story_id]).chapters.find(params[:id])
    end

    def set_chapters
      @chapters = Story.find(params[:story_id]).chapters 
    end

    def chapter_params
      params.require(:chapter).permit(:body)
    end
end
