class Genre < ActiveRecord::Base
  belongs_to :story

private
  def genre_params
    params.require(:body).permit(:body)
  end
end
