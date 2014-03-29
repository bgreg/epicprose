class Chapter < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :body, presence: true, length: {
    maximum: 120,
    minimum: 2
  }
  validates_associated :story, message: "Only 6 chapters allowed"
end
