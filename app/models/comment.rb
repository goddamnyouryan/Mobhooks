class Comment < ActiveRecord::Base
  attr_accessible :user_id, :commenter_id, :message
  
  belongs_to :user
  
end
