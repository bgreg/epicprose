class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = get_user_stories
  end

  def show
  end

  def new
    @story = Story.new
    @friends = get_friends
  end

  def create
    co_author = get_co_author
    redirect_to new_story_path, alert: "valid co-author email required" and return unless co_author 

    @story = Story.new( story_params )
    @story.turn = current_user.id

    respond_to do |format|
      if @story.save && co_author
        current_user.stories  << @story
        co_author.stories     << @story
        assign_story_roles
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  private
    def set_story
      @story = Story.find( params[:id] )
    end

    def get_co_author
      user = User.where( email: params[:co_author] ).first
      user = nil if user.id == current_user.id
      user
    end

    def story_params
      params.require(:story).permit(:title, :picture_url)
    end

    def assign_story_roles
      s = StoryRole.where( story_id: @story.id,
        user_id:  get_co_author.id ).first
      s.role = :co_author
      s.save

      s = StoryRole.where( story_id: @story.id,
        user_id:  current_user.id).first
      s.role = :author
      s.save
    end

    def get_user_stories
      if current_user.stories.empty?
        stories = []
      else
        stories = current_user.stories
      end
      stories
    end

    def get_friends
      friends = []
      current_user.stories.each do |story|
        story.users.each do |user|
          friends << user.email if user.email != current_user.email
        end
      end
      friends.uniq
    end
end
