class Genre < ActiveRecord::Base
  belongs_to :story
  validates_presence_of :body

private
  def genre_params
    params.require(:body).permit(:body)
  end
end
