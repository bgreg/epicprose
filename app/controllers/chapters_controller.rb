class ChaptersController < ApplicationController
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy]
  before_action :set_chapters, only: [:index]

  # GET /chapters
  # GET /chapters.json
  def index
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        story = Story.find(params[:story_id])
        @chapter.user = current_user
        story.chapters << @chapter
        story.save

        format.html { redirect_to "/stories/#{params[:story_id]}/chapters/#{params[:id]}",
                      notice: 'Chapter was successfully created.' }
        format.json { render action: 'show',
                      status: :created, location: [:story,@chapter]}
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        story = Story.find(params[:story_id])
        @chapter.user = current_user
        story.chapters << @chapter
        story.save

        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to story_chapters_path(params[:story_id])}
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
