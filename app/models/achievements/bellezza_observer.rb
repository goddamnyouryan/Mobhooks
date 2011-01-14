class BellezzaObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Bellezza.award_achievements_for(campaign.user) if campaign.tag_list.include?("beauty") || campaign.tag_list.include?("spa") || campaign.tag_list.include?("salon") || campaign.tag_list.include?("barber") || campaign.tag_list.include?("facial") || campaign.tag_list.include?("waxing") || campaign.tag_list.include?("manicure") || campaign.tag_list.include?("pedicure") || campaign.tag_list.include?("massage")
  end
end