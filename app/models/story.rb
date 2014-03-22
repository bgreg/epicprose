class Story < ActiveRecord::Base

  attr_accessible :title
  attr_accessible :picture_url

  has_many :chapters, dependent: :destroy
  has_and_belongs_to_many :users
  has_one :genre
end
