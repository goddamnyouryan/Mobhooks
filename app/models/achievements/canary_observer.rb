class CanaryObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Canary.award_achievements_for(campaign.user) if campaign.tag_list.include?("media") || campaign.tag_list.include?("station") || campaign.tag_list.include?("radio station") || campaign.tag_list.include?("radio") || campaign.tag_list.include?("tv station") || campaign.tag_list.include?("newspaper") || campaign.tag_list.include?("internet") || campaign.tag_list.include?("magazine") || campaign.tag_list.include?("broadcast")
  end
end