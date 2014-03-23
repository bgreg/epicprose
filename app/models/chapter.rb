class Chapter < ActiveRecord::Base

  # Relationships
  #
  belongs_to :story
  belongs_to :user

  # Validations
  #
  validates :body, presence: true, length: {
    maximum: 120,
    minimum: 2
  }
  validates_associated :story

private

  def chapter_params
    params.require(:body).permit(:body)
  end
end
