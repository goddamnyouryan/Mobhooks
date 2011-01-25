class Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true
  
  acts_as_mappable
  
  attr_accessible :business_id, :address, :city, :state, :zip
  
  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address, :case_sensitive => false, :message => "- This Location has already been entered!"
end
