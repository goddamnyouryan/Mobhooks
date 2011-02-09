class Suggestions < ActiveRecord::Base
  attr_accessible :user_id, :message
  
  def deliver_new_suggestions!
    Notifier.deliver_new_suggestion(self)
  end
  
end
