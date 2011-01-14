class BootLegObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    BootLeg.award_achievements_for(campaign.user) if campaign.tag_list.include?("bar") || campaign.tag_list.include?("club")|| campaign.tag_list.include?("lounge") || campaign.tag_list.include?("nightlife")
  end
end