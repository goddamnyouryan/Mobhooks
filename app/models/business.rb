class Business < ActiveRecord::Base
  
  acts_as_taggable

  attr_accessible :name, :address, :city, :state, :zip, :description, :photo, :kind, :url
  
  has_many :campaigns
  has_many :locations
  belongs_to :users
  
  has_attached_file :photo, :styles => { :tiny => "30x30#", :main => "90x90>", :small => "200x200#", :medium => "370x370>" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
  
  validates_presence_of :address, :city, :state, :zip, :on => :update, :if => Proc.new { |business| business.kind == "local" }
  validates_presence_of :url, :photo, :on => :update, :if => Proc.new { |business| business.kind == "brand" }
  validates_presence_of :name
  validates_presence_of :kind, :message => "You must select A Business Type"
  # validates_uri_existence_of :url, :with => %r{(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?}x
  
end
