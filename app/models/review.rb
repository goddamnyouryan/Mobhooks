class Review < ActiveRecord::Base
  attr_accessible :user_id, :reviewer_id, :message
  
  belongs_to :campaign
end
