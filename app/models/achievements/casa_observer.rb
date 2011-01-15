class CasaObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Casa.award_achievements_for(campaign.user) if campaign.tag_list.include?("house") || campaign.tag_list.include?("real estate") || campaign.tag_list.include?("apartment") || campaign.tag_list.include?("rent") || campaign.tag_list.include?("property")
  end
end