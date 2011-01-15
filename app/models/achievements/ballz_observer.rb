class BallzObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Ballz.award_achievements_for(campaign.user) if campaign.tag_list.include?("sports") || campaign.tag_list.include?("arena") || campaign.tag_list.include?("baseball") || campaign.tag_list.include?("basketball") || campaign.tag_list.include?("football") || campaign.tag_list.include?("soccer") || campaign.tag_list.include?("hockey") || campaign.tag_list.include?("bowling") || campaign.tag_list.include?("tennis") || campaign.tag_list.include?("track") || campaign.tag_list.include?("lacrosse")
  end
end