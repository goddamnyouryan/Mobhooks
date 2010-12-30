class BookmakerObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Bookmaker.award_achievements_for(campaign.user) if campaign.tag_list.include?("casino")
  end
end