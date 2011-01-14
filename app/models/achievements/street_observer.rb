class StreetObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Street.award_achievements_for(campaign.user) if campaign.tag_list.include?("local")  || campaign.tag_list.include?("fair") || campaign.tag_list.include?("carnival") || campaign.tag_list.include?("museum") || campaign.tag_list.include?("theme park") || campaign.tag_list.include?("park")
  end
end