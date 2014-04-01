module StoriesHelper
  def get_co_author(story_id)
    StoryRole.where(story_id: story_id, role: :co_author).first.user.email
  end
  def get_author(story_id)
    StoryRole.where(story_id: story_id, role: :author).first.user.email
  end

  def get_user(id)
   id && User.find(id).email
  end

  def get_turn(id)
    id || current_user.id
  end

end
