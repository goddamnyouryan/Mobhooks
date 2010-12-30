class Campaign < ActiveRecord::Base
  include Achievements
  attr_accessible :user_id, :business_id, :offer, :shortcode, :keyword, :start_date, :end_date, :type, :details, :photo
  
  belongs_to :user
  belongs_to :business
  
  has_many :reviews
  
  acts_as_voteable
  acts_as_mappable
  acts_as_taggable
  
  has_attached_file :photo, :styles => { :thumb => "90x90#", :show => "540x200#" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
  
                                     
                            
  def business_name
    business.name if business
  end
 
  def business_name=(name)
    self.business = Business.find_by_name(name) unless name.blank?
  end
  
  
  def self.search(search)
    if search
      find(:all, 
           :joins => :business, 
           :conditions => ['offer LIKE ? OR details LIKE ? OR tag_list LIKE ? OR businesses.name LIKE ? OR businesses.description LIKE ? OR businesses.tag_list LIKE ?', 
                           "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
                          ]
           )
    else
      find(:all)
    end
  end
  
  def self.location_search(search, near)
    if search && near && near != ""
      f = find(:all, 
           :joins => :business, 
           :conditions => ['offer LIKE ? OR details LIKE ? OR businesses.name LIKE ? OR businesses.description LIKE ?', 
                           "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"],
           :origin => "#{near}",
           :within => 25
           )
    elsif search
      find(:all, 
           :joins => :business, 
           :conditions => ['offer LIKE ? OR details LIKE ? OR businesses.name LIKE ? OR businesses.description LIKE ?', 
                           "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%",
                          ]
           )       
    else
      find(:all)
    end
  end
  
end
