class WiseGuyObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    WiseGuy.award_achievements_for(campaign.user) if campaign.tag_list.include?("school") || campaign.tag_list.include?("univsersity") || campaign.tag_list.include?("education") || campaign.tag_list.include?("training") || campaign.tag_list.include?("class") || campaign.tag_list.include?("books") || campaign.tag_list.include?("university") || campaign.tag_list.include?("college")
  end
end