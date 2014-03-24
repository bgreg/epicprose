class Genre < ActiveRecord::Base
  validates_presence_of :body

  def self.random_genre
    Genre.limit(1).offset(rand(Genre.count)).first
  end
private
  def genre_params
    params.require(:body).permit(:body)
  end
end
