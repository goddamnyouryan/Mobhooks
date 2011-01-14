class AchievementsController < ApplicationController
  def index
  	@master_badge_user = User.find_by_login("goddamnyouryan")
  	@master_badge_list = Achievement.find(:all, :conditions => ["user_id = ?", @master_badge_user.id], :order => "kind ASC")
  end

  def show
  	@achievement = Achievement.find(params[:id])
  	@klass = Kernel.const_get @achievement.kind
  end

end
