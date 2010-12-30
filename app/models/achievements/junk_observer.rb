class JunkObserver < ActiveRecord::Observer
    observe :campaign

    def after_save(campaign)
      Junk.award_achievements_for(campaign.user) if campaign.tag_list.include?("pharmacy") || campaign.tag_list.include?("drugs") || campaign.tag_list.include?("pharmaceutical")
    end
  end