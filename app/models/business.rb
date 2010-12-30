class Business < ActiveRecord::Base
  
  acts_as_taggable
  
  attr_accessible :name, :address, :city, :state, :zip, :description, :photo
  
  has_many :campaigns
  belongs_to :users
  
  has_attached_file :photo, :styles => { :tiny => "30x30#", :thumb => "90x90#", :small => "200x200#", :medium => "400x400#" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
  
  
end
