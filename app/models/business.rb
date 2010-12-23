class Business < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :zip, :description, :photo
  
  has_many :campaigns
  belongs_to :users
  
  has_attached_file :photo, :styles => { :thumb => "90x90#", :small => "200x200#", :medium => "400x400#" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
  
  
end
