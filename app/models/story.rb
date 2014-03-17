class Story < ActiveRecord::Base
  #todo: add validation and attr_accessors
  attr_accessible :title
  attr_accessible :picture_url

  has_many :chapters, dependent: :destroy
  has_and_belongs_to_many :users
end
