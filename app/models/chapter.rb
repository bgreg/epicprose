class Chapter < ActiveRecord::Base
  #todo: add validation and attr_accessors
  # update migrations
  # fix nested resource links
  # make everything work without any front end work
  attr_accessible :body
  belongs_to :story
  belongs_to :user
  validates :body, presence: true, length: { maximum: 120}
end
