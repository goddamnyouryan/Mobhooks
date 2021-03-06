# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  
  def age(birthday)
		(((Date.today  -  birthday.to_date).to_i)/365).round
	end
	
	def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
	
	def score_percentage(campaign)
	  unless campaign.votes_count == 0
      ((campaign.votes_for.to_f/campaign.votes_count.to_f)*100).round
    else
      0
    end
  end
  
  def level(user)
    @users = User.find :all, :order => "points DESC"
    if @users[0] == user
      "Don"
    elsif @users[1] == user
      "Underboss"
    elsif user.points > 5000
      "Capo"
    elsif user.points > 1000
      "Soldier"
    else
      "Associate"
    end
  end

  
  def campaign_time(campaign)
  	if Date.today > (campaign.start_date.to_date) && Date.today < (campaign.end_date.to_date)
  		"#{((campaign.end_date.to_date - Date.today).to_i).round} days left"
  	elsif Date.today == campaign.start_date.to_date
  		"This campaign starts TODAY!"
  	elsif Date.today == campaign.end_date.to_date
  		"This campaign ends TODAY!"
  	elsif Date.today < campaign.start_date.to_date
  		"starts in #{(((campaign.start_date.to_date) - Date.today).to_i).round} days"
  	else
  		"this campaign has expired."
  	end
  end
  
  def reviewed?(campaign)
    campaign.reviews.find_by_reviewer_id(current_user.id)
  end
  
  def random_profile_image
    ["#{image_tag "missing_profile.png"}", "#{image_tag "missing_profile1.png"}", "#{image_tag "missing_profile2.png"}", "#{image_tag "missing_profile3.png"}"].rand
  end
  
  def random_leaderboard_image
    ["#{image_tag "missing_leaderboard.png"}", "#{image_tag "missing_leaderboard1.png"}", "#{image_tag "missing_leaderboard2.png"}", "#{image_tag "missing_leaderboard3.png"}"].rand
  end
  
end
