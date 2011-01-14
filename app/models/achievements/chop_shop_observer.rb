class ChopShopObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    ChopShop.award_achievements_for(campaign.user) if campaign.tag_list.include?("car") || campaign.tag_list.include?("automotive") || campaign.tag_list.include?("auto") || campaign.tag_list.include?("dealership") || campaign.tag_list.include?("mechanic") || campaign.tag_list.include?("dealer") || campaign.tag_list.include?("oil change") || campaign.tag_list.include?("tires") || campaign.tag_list.include?("brakes")
  end
end