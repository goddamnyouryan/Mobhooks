class Campaign < ActiveRecord::Base
  include Achievements
  attr_accessible :user_id, :business_id, :offer, :shortcode, :keyword, :start_date, :end_date, :type, :details, :photo
  
  belongs_to :user
  belongs_to :business
  
  has_many :reviews
  has_many :locations, :through => :business
  
  acts_as_voteable
  acts_as_mappable
  acts_as_taggable
  
  has_attached_file :photo, :styles => { :thumbnail => "90x90#", :show => "540x200#" }, 
                            :storage => :s3, 
                            :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                            :path => ':id/:style'
                            
  validates_presence_of :offer, :shortcode, :keyword, :type, :tag_list, :business_id
  validates_numericality_of :shortcode
  validates_uniqueness_of :keyword, :scope => :shortcode, :case_sensitive => false, :message => "- This campaign has already been submitted."

                                     
                            
  def business_name
    business.name if business
  end
  
  def business_kind
    business.kind if business
  end
 
  def business_name=(name)
    self.business = Business.find_by_name(name) unless name.blank?
  end
  
  
  def self.search(search)
    if search
      find(:all, 
           :include => :business, 
           :conditions => ['LOWER(offer) LIKE ? OR LOWER(details) LIKE ? OR LOWER(businesses.name) LIKE ? OR LOWER(businesses.description) LIKE ?', 
                             "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%"
                            ]
           )
    else
      find(:all)
    end
  end
  
  def self.location_search(search, near, distance)
    if search && near && near != "" && near != "near..."
      find(:all, 
           :include => :business, 
           :conditions => ['LOWER(offer) LIKE ? OR LOWER(details) LIKE ? OR LOWER(businesses.name) LIKE ? OR LOWER(businesses.description) LIKE ?', 
                            "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%"
                           ],
           :origin => "#{near}",
           :within => distance
           )
    elsif search
      find(:all, 
           :include => :business, 
           :conditions => ['LOWER(offer) LIKE ? OR LOWER(details) LIKE ? OR LOWER(businesses.name) LIKE ? OR LOWER(businesses.description) LIKE ?', 
                             "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%"
                            ]
           )       
    else
      find(:all)
    end
  end
  
  def self.chain_search(search)
    if search
      find(:all, 
           :include => :business, 
           :conditions => ['LOWER(offer) LIKE ? OR LOWER(details) LIKE ? OR LOWER(businesses.name) LIKE ? AND businesses.kind = ?', 
                             "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "chain"
                            ]
      )
    else
      find(:all)
    end
  end
  
  def self.brand_search(search)
    if search
      find(:all, 
           :include => :business, 
           :conditions => ['LOWER(offer) LIKE ? OR LOWER(details) LIKE ? OR LOWER(businesses.name) LIKE ? AND businesses.kind = ?', 
                             "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "%#{search.to_s.downcase}%", "brand"
                            ]
      )
    else
      find(:all)
    end
  end
  
end
