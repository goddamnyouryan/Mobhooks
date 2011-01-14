class HeistObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Heist.award_achievements_for(campaign.user) if campaign.tag_list.include?("bank") || campaign.tag_list.include?("finance")  || campaign.tag_list.include?("401K") || campaign.tag_list.include?("loan") || campaign.tag_list.include?("annuity") || campaign.tag_list.include?("living trust")
  end
end