class RatObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Rat.award_achievements_for(campaign.user) if campaign.tag_list.include?("professional") || campaign.tag_list.include?("legal") || campaign.tag_list.include?("lawyer") || campaign.tag_list.include?("notary") || campaign.tag_list.include?("accountant") || campaign.tag_list.include?("electrician") || campaign.tag_list.include?("plumber") || campaign.tag_list.include?("contractor") || campaign.tag_list.include?("builder") || campaign.tag_list.include?("handyman") || campaign.tag_list.include?("tax") || campaign.tag_list.include?("accounting")
  end
end