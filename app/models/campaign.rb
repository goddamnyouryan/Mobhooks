class Campaign < ActiveRecord::Base
  attr_accessible :user_id, :business_id, :offer, :shortcode, :keyword, :start_date, :end_date, :type, :details
  
  belongs_to :user
  belongs_to :business
  
  has_many :reviews
  
  acts_as_voteable
  
  has_attached_file :photo, :styles => { :thumb => "90x90" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
end
