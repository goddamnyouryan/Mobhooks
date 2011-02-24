class HomeController < ApplicationController
  def index
    @tags = Campaign.tag_counts
    @popular_un_unique = Campaign.find :all, :joins => :votes, :conditions => ["votes.created_at >=?", 1.week.ago], :limit => 5
    @popular = @popular_un_unique.uniq
    #@sponsored1 = Campaign.find 1
    #@sponsored2 = Campaign.find 4
    #@sponsored3 = Campaign.find 6
    #@sponsored4 = Campaign.find 11
    #@sponsored = [@sponsored1, @sponsored2, @sponsored3, @sponsored4]
     @sponsored = Campaign.find :all, :limit => 4
    @recent = Campaign.find :all, :order => "created_at DESC", :limit => 10
  end

end
