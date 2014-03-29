module StoriesHelper
  def get_co_author(story_id)
    StoryRole.where(story_id: story_id, role: :co_author).first.user.email
  end
end
