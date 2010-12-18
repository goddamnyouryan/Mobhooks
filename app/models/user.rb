class User < ActiveRecord::Base
    acts_as_authentic
    acts_as_voter
    
    has_many :campaigns
    has_many :businesses
    has_one :profile
    has_many :comments
end
