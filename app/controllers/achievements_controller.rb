class AchievementsController < ApplicationController
  after_filter :mark_unread_achievements_as_read, :only => :show
  
  def index
  	@master_badge_user = User.find_by_login("goddamnyouryan")
  	@master_badge_list = Achievement.find(:all, :conditions => ["user_id = ?", @master_badge_user.id], :order => "kind ASC")
  end

  def show
  	@achievement = Achievement.find(params[:id])
  	@klass = Kernel.const_get @achievement.kind
  	@user = User.find(@achievement.user)
  	@achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", @user.id, "unread"])
  	if @achievements.size > 1
  	  unless @achievements.index(@achievement) == @achievements.index(@achievements.last)
  	    @next_achievement = @achievements.index(@achievement) + 1
  	    @next = @achievements[@next_achievement]
  	  end
  	end
  end
  
  private
  
   def mark_unread_achievements_as_read
     if @user == current_user
       if @achievement.state == "unread"
         @achievement.view!
         if @achievements.size <= 1
         if session[:campaign_continue]
       	   session[:campaign_continue] = nil
       	 end
     	   end  
       end
     end
    end
    
end
