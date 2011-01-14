class Affiliate < ActiveRecord::Base
  attr_accessible :user_id, :name, :business_name, :address, :phone_number, :email
end
