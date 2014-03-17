class Chapter < ActiveRecord::Base
  #todo: add validation and attr_accessors
  # update migrations
  # fix nested resource links
  # make everything work without any front end work
  belongs_to :story
end
