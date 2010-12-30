class ShakedownObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Shakedown.award_achievements_for(campaign.user) if campaign.tag_list.include?("bar") || campaign.tag_list.include?("food") || campaign.tag_list.include?("club") || campaign.tag_list.include?("restaurant")
  end
end