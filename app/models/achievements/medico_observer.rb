class MedicoObserver < ActiveRecord::Observer
    observe :campaign

    def after_save(campaign)
      Medico.award_achievements_for(campaign.user) if campaign.tag_list.include?("pharmacy") || campaign.tag_list.include?("drugs") || campaign.tag_list.include?("pharmaceutical") || campaign.tag_list.include?("doctor") || campaign.tag_list.include?("medical") || campaign.tag_list.include?("hospital") || campaign.tag_list.include?("health") || campaign.tag_list.include?("nursing") || campaign.tag_list.include?("nursing home") || campaign.tag_list.include?("assisted living") || campaign.tag_list.include?("home health") || campaign.tag_list.include?("nurse")
    end
  end