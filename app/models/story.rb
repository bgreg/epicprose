class Story < ActiveRecord::Base
  #todo: add validation and attr_accessors
  has_many :chapters
end
