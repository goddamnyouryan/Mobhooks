class BribeObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Bribe.award_achievements_for(campaign.user) if campaign.tag_list.include?("legal") || campaign.tag_list.include?("law") || campaign.tag_list.include?("lawyer") || campaign.tag_list.include?("political")
  end
end