class Profile < ActiveRecord::Base
  attr_accessible :user_id, :name, :zip, :sex, :birthday, :website, :quote, :photo
  
  has_attached_file :photo, :styles => { :thumb => "90x90#" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
  
  belongs_to :user
  
  VALID_GENDERS = ["Male", "Female"]
	START_YEAR = 1900
	VALID_DATES = DateTime.new(START_YEAR)..DateTime.now
	
	validates_inclusion_of :sex,
												 :in => VALID_GENDERS,
												 :allow_nil => true,
												 :message => 'must be male or female'
												 
	validates_inclusion_of :birthday,
												 :in => VALID_DATES,
												 :allow_nil => true,
												 :message => 'is invalid!'
	
end
