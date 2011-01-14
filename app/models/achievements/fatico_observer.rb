class FaticoObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Fatico.award_achievements_for(campaign.user) if campaign.tag_list.include?("coke") || campaign.tag_list.include?("mcdonalds") || campaign.tag_list.include?("pepsi")
  end
end