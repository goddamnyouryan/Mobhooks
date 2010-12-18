class Business < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :zip, :description
  
  has_many :campaigns
  belongs_to :users
  
end
