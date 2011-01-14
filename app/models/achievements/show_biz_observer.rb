class ShowBizObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    ShowBiz.award_achievements_for(campaign.user) if campaign.tag_list.include?("music") || campaign.tag_list.include?("movies") || campaign.tag_list.include?("film")  || campaign.tag_list.include?("tv") || campaign.tag_list.include?("show") || campaign.tag_list.include?("theater") 
  end
end