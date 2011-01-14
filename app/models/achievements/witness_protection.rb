class WitnessProtection < Achievement
  
  # level 1, :quota => 5
  # level 2, :quota => 10
  # level 3, :quota => 30
  # level 4, :quota => 100
  # level 5, :quota => 500
  
  # set_thing_to_check { |user| ... }

  # Comment out below for multi-level achievements
  # def self.award_achievements_for(user)
  #   return unless user
  #   levels.each do |level|
  #     if user.not.has_achievement?(self, level[:level]) and thing_to_check(user) >= level[:quota]
  #       user.award_achievement(self, level[:level])
  #     end
  #   end
  # end

  # Comment out below for once-off achievements
   def self.award_achievements_for(user)
     return unless user
     return if user.has_achievement?(self)
     achievement = Achievement.new(:user => user, :kind => "WitnessProtection", :level => nil)
     achievement.save!
   end
   
   def self.image
    'badges/witnessprotection.png'
   end
   
   def self.small_image
    'badges/small/witnessprotection.jpg'
   end
   
   def self.description
   	'Submitting a Travel or Hotel text campaign to earn this badge.'
   end
  
end