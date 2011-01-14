class BribeObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Bribe.award_achievements_for(campaign.user) if campaign.tag_list.include?("law") ||  campaign.tag_list.include?("political") || campaign.tag_list.include?("politics") || campaign.tag_list.include?("government") || campaign.tag_list.include?("campaign") || campaign.tag_list.include?("president")|| campaign.tag_list.include?("senator") || campaign.tag_list.include?("congress")
  end
end