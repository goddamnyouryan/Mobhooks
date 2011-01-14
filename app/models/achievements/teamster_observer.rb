class TeamsterObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Teamster.award_achievements_for(campaign.user) if campaign.tag_list.include?("subway") || campaign.tag_list.include?("bus") || campaign.tag_list.include?("water") || campaign.tag_list.include?("gas") || campaign.tag_list.include?("legal") || campaign.tag_list.include?("electric") || campaign.tag_list.include?("power")
  end
end