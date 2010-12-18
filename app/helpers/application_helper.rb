# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def age(birthday)
		(((Date.today  -  birthday.to_date).to_i)/365).round
	end
  
end
