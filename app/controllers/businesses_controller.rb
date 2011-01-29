class BusinessesController < ApplicationController
  after_filter :clear_campaign_session, :only => :update
  before_filter :require_user, :only => :edit
	
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
    if session[:campaign_continue]
      @campaign = Campaign.find(session[:campaign_continue])
    end
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
      if params[:business][:address]
        current_user.points = current_user.points + 10
        current_user.save
      elsif params[:business][:url]
        unless params[:business][:url] == "http://" || params[:business][:url] == ""
          current_user.points = current_user.points + 5
          current_user.save
        end
      elsif params[:business][:photo]
        current_user.points = current_user.points + 5
        current_user.save
      end
      @achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", current_user.id, "unread"])
      if @achievements.empty?
        if params[:business][:address]
          flash[:notice] = "Successfully added business address."
          redirect_to @business
        elsif params[:business][:url] && params[:business][:photo] != ""
          flash[:notice] = "Successfully added business photo and website."
          redirect_to @business
        elsif params[:business][:url] && params[:business][:photo] == ""
          flash[:notice] = "Successfully added business website."
          redirect_to @business
        elsif params[:business][:photo]
          flash[:notice] = "Successfully added business photo."
          redirect_to @business
        else
          redirect_to @business
        end
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
  
  def skip_business
    @campaign = current_user.campaigns.last
    @achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", current_user.id, "unread"])
    if @achievements.empty?
      flash[:notice] = "Skipped business address Entry."
      redirect_to @campaign
    else
      flash[:notice] = "You've been awarded a new badge!"
      redirect_to @achievements[0]
    end
  end
  
  private
  
   def clear_campaign_session
     if session[:created_campaign]
       session[:created_campaign] = nil
     end
   end
  
end
