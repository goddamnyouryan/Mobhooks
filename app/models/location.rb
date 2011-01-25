class Location < ActiveRecord::Base
  
  acts_as_mappable
  
  attr_accessible :business_id, :address, :city, :state, :zip
  
  belongs_to :business
  has_many :campaigns
  
  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address, :case_sensitive => false, :message => "- This Location has already been entered!"
end
