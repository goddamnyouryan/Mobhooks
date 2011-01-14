class FirstscoreObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Firstscore.award_achievements_for(campaign.user) if campaign.user.campaigns.count == 1
  end
end