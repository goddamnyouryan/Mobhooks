class HomeController < ApplicationController
  
  require 'net/http'
  require 'rexml/document'
  
  def index
    @tags = Campaign.tag_counts
    @popular_un_unique = Campaign.find :all, :joins => :votes, :conditions => ["votes.created_at >=?", 1.week.ago], :limit => 5
    @popular = @popular_un_unique.uniq
    @yup = "http://steals.mobhooks.com/publishers/mobhooks/deal-of-the-day.xml"
    @xml = Net::HTTP.get_response(URI.parse(@yup))
    @doc = REXML::Document.new(@xml.body)
    @read = @doc.elements.to_a
    @recent = Campaign.find :all, :order => "created_at DESC", :limit => 10
  end
  

end
