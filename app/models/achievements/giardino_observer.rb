class GiardinoObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Giardino.award_achievements_for(campaign.user) if campaign.tag_list.include?("home") || campaign.tag_list.include?("garden") || campaign.tag_list.include?("lawn") || campaign.tag_list.include?("landscape") || campaign.tag_list.include?("landscaping")
  end
end