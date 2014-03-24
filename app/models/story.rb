class Story < ActiveRecord::Base
  has_many :chapters,  dependent: :destroy
  has_and_belongs_to_many :users
  has_one :genre

  validate :chapter_limit_not_reached, on: :create
  validates :title, presence: true, length: {
    minimum: 2,
    maximum: 120,
    too_short: "Must have at least 2 characters",
    too_long: "Must have at most 120 characters "
  }

  before_create :before_create

private

  def before_create
    self.genre = Genre.random_genre
    self.picture_url = Image.random_image
  end

  def chapter_limit_not_reached
    errors.add(:chapter, "Cannot have more than 6 chapters") if chapters.size > 6
  end

  def story_params
    params.require(:story).permit(:title, :picture_url)
  end
end
