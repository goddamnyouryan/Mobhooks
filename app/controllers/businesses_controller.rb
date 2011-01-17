class BusinessesController < ApplicationController
  after_filter :clear_campaign_session, :only => :create
	
  def index
    @businesses = Business.all
    @biznass = Business.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end
  
  def admin
    @businesses = Business.all
  end
  
  def show
    @business = Business.find(params[:id])
  end
  
  def new
    @business = Business.new
    @business_name = session[:business_name]
  end
  
  def create
    @business = Business.find(params[:business])
    if @business.save
      if session[:created_campaign]
        @campaign = session[:created_campaign]
        @campaign.business_id = @business.id
        @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{@business.address} #{@business.city} #{@business.city} #{@business.zip}"
        @campaign.lat = @geocode.lat
        @campaign.lng = @geocode.lng
        current_user.points = current_user.points + 100
        current_user.save
        @campaign.save
        session[:business_name] = nil
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @business = Business.find(params[:id])
    @business_name = @business.name
  end
  
  def update
    @business = Business.find(params[:id])
    @business.tag_list = params[:business][:tag_list]
    if @business.update_attributes(params[:business])
      @business.campaigns.each do |campaign|
        @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{params[:business][:address]} #{params[:business][:city]} #{params[:business][:state]} #{params[:business][:zip]}"
        campaign.lat = @geocode.lat
        campaign.lng = @geocode.lng
        campaign.save!
      end
      current_user.points = current_user.points + 100
      current_user.save
      @achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", current_user.id, "unread"])
      if @achievements.empty?
        flash[:notice] = "Successfully added business address."
        redirect_to @business
      else
        flash[:notice] = "Successfully added business address. And you've been awarded a new badge!"
        session[:campaign_continue] = @business.campaigns.last.id
        redirect_to @achievements[0]
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    flash[:notice] = "Successfully destroyed business."
    redirect_to businesses_url
  end
  
  private
  
   def clear_campaign_session
     if session[:created_campaign]
       session[:created_campaign] = nil
      end
   end
  
end
