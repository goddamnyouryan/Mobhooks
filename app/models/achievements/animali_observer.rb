class AnimaliObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Animali.award_achievements_for(campaign.user) if campaign.tag_list.include?("pets") || campaign.tag_list.include?("animals") || campaign.tag_list.include?("farm") || campaign.tag_list.include?("dogs") || campaign.tag_list.include?("cats") || campaign.tag_list.include?("health")
  end
end