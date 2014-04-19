class StoryRole < ActiveRecord::Base
 belongs_to :user
 belongs_to :story

 def assign_role( role )
   self.role =  role
   self.save
 end
end
