class WitnessProtectionObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    WitnessProtection.award_achievements_for(campaign.user) if campaign.tag_list.include?("hotel") || campaign.tag_list.include?("motel") || campaign.tag_list.include?("travel") || campaign.tag_list.include?("vacation") || campaign.tag_list.include?("airline") || campaign.tag_list.include?("flight") || campaign.tag_list.include?("car rental") || campaign.tag_list.include?("rental")
  end
end