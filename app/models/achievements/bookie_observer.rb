class BookieObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Bookie.award_achievements_for(campaign.user) if campaign.tag_list.include?("casino") || campaign.tag_list.include?("gambling")
  end
end