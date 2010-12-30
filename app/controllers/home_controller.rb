class HomeController < ApplicationController
  def index
    @tags = Campaign.tag_counts
    @popular = Campaign.find(:all, :joins => :votes, :limit => 5)
  end

end
