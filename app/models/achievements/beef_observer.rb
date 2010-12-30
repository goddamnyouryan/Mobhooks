class BeefObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Beef.award_achievements_for(campaign.user) if campaign.tag_list.include?("gym") || campaign.tag_list.include?("fitness") || campaign.tag_list.include?("yoga") || campaign.tag_list.include?("exercise")
  end
end