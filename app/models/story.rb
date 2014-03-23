class Story < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_and_belongs_to_many :users
  has_one :genre

private

  def story_params
    params.require(:story).permit(:title, :picture_url)
  end
end
