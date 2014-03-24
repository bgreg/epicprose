class Genre < ActiveRecord::Base
  validates_presence_of :body
private
  def genre_params
    params.require(:body).permit(:body)
  end
end
