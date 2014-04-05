module StoriesHelper
  def get_co_author( story_id )
    StoryRole.where( story_id: story_id, role: :co_author ).first.user.email
  end

  def get_author( story_id )
    StoryRole.where(story_id: story_id, role: :author).first.user.email
  end

  def get_user_turn( id )
    turn = "Your turn"
    turn =  User.find( id ).email if id != current_user.id
    turn
  end

end
