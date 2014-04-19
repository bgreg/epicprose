class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :stories, through: :story_roles
  has_many :story_roles
  has_many :chapters

  def get_friends
    friends = []
    self.stories.each do |story|
      story.users.each do |user|
        friends << user.email if user.email != self.email
      end
    end
    friends.uniq
  end

  def get_user_stories
    if self.stories.empty?
      stories = []
    else
      stories = self.stories
    end
    stories
  end
end
