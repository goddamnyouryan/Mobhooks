# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def age(birthday)
		(((Date.today  -  birthday.to_date).to_i)/365).round
	end
	
	def score_percentage(campaign)
	  unless campaign.votes_count == 0
      ((campaign.votes_for/campaign.votes_count)*100).round
    else
      0
    end
  end
  
end
