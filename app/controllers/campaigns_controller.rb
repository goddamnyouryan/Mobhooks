class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end
  
  def admin
     @campaigns = Campaign.all
  end
  
  def create
    if current_user
    @campaign = current_user.campaigns.new(params[:campaign])
    @business = Business.find_by_name(params[:campaign][:business_name])
    @campaign.tag_list = params[:campaign][:tag_list].downcase
    @campaign.kind = params[:campaign][:kind]
    @business_name = params[:campaign][:business_name]
    unless @business.nil?
      @campaign.business_id = @business.id
      @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{@business.address} #{@business.city} #{@business.city} #{@business.zip}"
      @campaign.lat = @geocode.lat
      @campaign.lng = @geocode.lng
      @campaign.save!
      if @campaign.kind == "Text Club"
        current_user.points = current_user.points + 50
        current_user.save
      elsif @campaign.kind == "Discount/Coupon"
        current_user.points = current_user.points + 100
        current_user.save
      elsif @campaign.kind == "Enter to Win"
        current_user.points = current_user.points + 200
        current_user.save
      end
      flash[:notice] = "Successfully created campaign."
      redirect_to @campaign
    else
      @campaign.save!
      flash[:notice] = "Successfully created campaign. Now please fill out the business info for this campaign."
      flash[:business_name] = @business_name
      session[:created_campaign] = @campaign.id
      redirect_to new_business_path
    end
  else
    redirect_to login_path
  end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    @campaign.tag_list = (params[:campaign][:tag_list]).downcase
    @campaign.kind = params[:campaign][:kind]
    if @campaign.update_attributes(params[:campaign])
      flash[:notice] = "Successfully updated campaign."
      redirect_to @campaign
    else
      render :action => 'edit'
    end
  end
  
  def show
    @campaign = Campaign.find(params[:id])
    @business = @campaign.business
    if current_user
      @zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{current_user.profile.zip}"
      @distance = @zip.distance_from("#{@campaign.lat}, #{@campaign.lng}").round
    end
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([@campaign.lat, @campaign.lng],15)
    @map.overlay_init(GMarker.new([@campaign.lat, @campaign.lng], :title => "#{@campaign.business.name}", :info_window => "#{@campaign.business.name}"))
    @related = Campaign.find_tagged_with(@campaign.tag_list, :limit => 3)
  end
  
  
  def index
    @campaigns = Campaign.location_search(params[:search], params[:near]) | Campaign.find_tagged_with(params[:search])
    if params[:near]
    @zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{params[:near]}"
    elsif current_user
    @zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{current_user.profile.zip}"
    end
  end
  

  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Successfully deleted campaign."
    redirect_to campaigns_url
  end
  
  def vote_up
    @campaign = Campaign.find(params[:campaign])
    @user = @campaign.user
    current_user.vote_for(@campaign)
    current_user.points = current_user.points + 1
    current_user.save
    @user.points = @user.points + 5
    @user.save
    render :update do |page| 
     page.replace_html "voting", "You voted this campaign up."
     page.replace_html "votes_for", "#{@campaign.votes_for} upvotes"
    end
  end
  
  def vote_down
    @campaign = Campaign.find(params[:campaign])
    current_user.vote_against(@campaign)
    current_user.points = current_user.points + 1
    current_user.save
    render :update do |page| 
     page.replace_html "voting", "You voted this campaign down."
     page.replace_html "votes_against", "#{@campaign.votes_against} downvotes"
    end
  end
  

end
