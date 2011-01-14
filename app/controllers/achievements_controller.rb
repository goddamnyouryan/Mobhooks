class AchievementsController < ApplicationController
  def index
  	@master_badge_user = User.find_by_login("goddamnyouryan")
  end

  def show
  	@achievement = Achievement.find(params[:id])
  	@klass = Kernel.const_get @achievement.kind
  end

end
