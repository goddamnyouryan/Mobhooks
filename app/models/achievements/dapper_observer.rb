class DapperObserver < ActiveRecord::Observer
  observe :campaign
  
  def after_save(campaign)
    Dapper.award_achievements_for(campaign.user) if campaign.tag_list.include?("clothes") || campaign.tag_list.include?("fashion") || campaign.tag_list.include?("apparel") || campaign.tag_list.include?("jewelry") || campaign.tag_list.include?("style") || campaign.tag_list.include?("department store") || campaign.tag_list.include?("mall") || campaign.tag_list.include?("strip mall")
  end
end