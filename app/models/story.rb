class Story < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_many :users, through: :story_roles
  has_many :story_roles
  has_one  :category

  validate :chapter_limit_not_reached, on: :update
  validates :title,
    presence: true,
    length: {
      minimum: 2,
      maximum: 120,
      too_short: "Must have at least 2 characters",
      too_long: "Must have at most 120 characters"
    }

  before_create :before_create

private

  def before_create
    self.category = Category.random_category
    self.picture_url = Image.random_image
  end

  def chapter_limit_not_reached
    errors.add(:story, "Cannot have more than 6 chapters") if chapters.size > 5
  end
end
