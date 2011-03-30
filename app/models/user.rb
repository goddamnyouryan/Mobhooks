class User < ActiveRecord::Base
    include Achievements
  
    attr_accessor :terms
  
    acts_as_authentic
    acts_as_voter
    
    has_many :campaigns
    has_many :businesses
    has_one :profile
    has_many :comments
    
    validates_presence_of :login, :email, :password, :password_confirmation
    validates_presence_of :sex, :birthday, :terms, :zip, :on => :create
    validates_inclusion_of :terms, :in => "1", :on => :create, :message => "- You must agree to our terms to sign up."
    
    
    def deliver_password_reset_instructions!
      reset_perishable_token!
      Notifier.deliver_password_reset_instructions(self)
    end
  
end
