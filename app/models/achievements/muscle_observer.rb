class MuscleObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Muscle.award_achievements_for(campaign.user) if campaign.tag_list.include?("gym") || campaign.tag_list.include?("fitness") || campaign.tag_list.include?("yoga") || campaign.tag_list.include?("exercise") || campaign.tag_list.include?("workout") || campaign.tag_list.include?("pilates") || campaign.tag_list.include?("trainer")
  end
end