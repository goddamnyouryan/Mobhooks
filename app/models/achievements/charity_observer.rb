class CharityObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Charity.award_achievements_for(campaign.user) if campaign.tag_list.include?("charity") || campaign.tag_list.include?("non-profit") || campaign.tag_list.include?("church") || campaign.tag_list.include?("temple") || campaign.tag_list.include?("religion")
  end
end