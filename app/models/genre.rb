class Genre < ActiveRecord::Base
  attr_accessible :body
  belongs_to :story
end
