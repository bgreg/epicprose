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
  validates_presence_of :picture_url
  validates_format_of :picture_url,
    with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/ ,
    message: "Valid URL is required"



private

  def chapter_limit_not_reached
    errors.add(:chapter, "Cannot have more than 6 chapters") if chapters.size > 6
  end

  def story_params
    params.require(:story).permit(:title, :picture_url)
  end
end
