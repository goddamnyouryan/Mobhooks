class ShakedownObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Shakedown.award_achievements_for(campaign.user) if campaign.tag_list.include?("food") || campaign.tag_list.include?("restaurant") || campaign.tag_list.include?("diner") || campaign.tag_list.include?("dinner") || campaign.tag_list.include?("supper") || campaign.tag_list.include?("lunch") || campaign.tag_list.include?("brunch") || campaign.tag_list.include?("breakfast") || campaign.tag_list.include?("deli")
  end
end