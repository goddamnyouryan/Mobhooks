class CampaignsController < ApplicationController
  def new
    if current_user
      @campaign = Campaign.new
    else
      redirect_to login_path
    end
  end
  
  def admin
     @campaigns = Campaign.all
  end
  
  def create
    @campaign = current_user.campaigns.new(params[:campaign])
    @business = Business.find_by_name(params[:campaign][:business_name])
    @campaign.tag_list = params[:campaign][:tag_list].downcase
    @campaign.kind = params[:campaign][:kind]
    @business_name = params[:campaign][:business_name]
    @business_kind = params[:campaign][:business_kind]
    unless @business.nil?
      @campaign.business_id = @business.id
      if @campaign.save
        @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{@business.address} #{@business.city} #{@business.city} #{@business.zip}"
        @campaign.lat = @geocode.lat
        @campaign.lng = @geocode.lng
        @campaign.save!
        current_user.points = current_user.points + 100
        current_user.save
        @achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", @campaign.user.id, "unread"])
        if @achievements.empty?
          flash[:notice] = "Successfully posted campaign."
          redirect_to @campaign
        else
          flash[:notice] = "Successfully posted campaign. And you've been awarded a new badge!"
          session[:campaign_continue] = @campaign.id
          redirect_to @achievements[0]
        end
      else
        render :action => 'new'
      end
    else
      @new_business = Business.create(:name => @business_name, :kind => @business_kind)
      @campaign.business_id = @new_business.id
      if @campaign.save
        current_user.points = current_user.points + 100
        current_user.save
        session[:campaign_continue] = @campaign.id
        if @new_business.kind == "local"
          flash[:notice] = "Successfully posted campaign. Now please fill out the address for this campaigns business."
          redirect_to edit_business_path(@new_business)
        elsif @new_business.kind == "brand" || @new_business.kind == "chain"
          flash[:notice] = "Sucessfully posted campaign. Please enter the web address for this business and upload the logo."
          redirect_to edit_business_path(@new_business)
        else
          redirect_to @campaign
        end
      else
        render :action => 'new'
      end
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
    if current_user && @business.address?
      unless current_user.profile.nil?
        @zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{current_user.profile.zip}"
        @distance = @zip.distance_from("#{@campaign.lat}, #{@campaign.lng}").round
      end
    end
    if @business.kind == 'local'
      if @business.address?
        @map = GMap.new("map_div")
        @map.control_init(:large_map => true,:map_type => true)
        @map.center_zoom_init([@campaign.lat, @campaign.lng],15)
        @map.overlay_init(GMarker.new([@campaign.lat, @campaign.lng], :title => "#{@campaign.business.name}", :info_window => "#{@campaign.business.name}"))
      end
    elsif @business.kind == 'chain'
      unless @business.locations.nil?
        @map = GMap.new("map_div")
        @map.control_init(:large_map => true,:map_type => true)
        if current_user
          unless current_user.profile.zip.nil?
            @zip = "#{current_user.profile.zip}"
            @location = Location.find_closest(:origin => @zip, :conditions => ["business_id =?", @business.id])
          else
            @location = @business.locations.first
          end
        else
          @location = @business.locations.first
        end
        @map.center_zoom_init([@location.lat, @location.lng],15)
        @map.overlay_init(GMarker.new([@location.lat, @location.lng], :title => "#{@location.business.name}", :info_window => "#{@location.business.name}"))
      end
    end
    @related = Campaign.find_tagged_with(@campaign.tag_list, :limit => 3)
  end
  
  
  def index
    if params[:search] == "Search for an Offer..." && params[:near] && params[:distance]
      @campaigns = Campaign.location_search("", params[:near], params[:distance])
    elsif params[:search] == "Search for an Offer..." && params[:near]
      @campaigns = Campaign.location_search("", params[:near], 25)
    elsif params[:search] == "Search for an Offer..."
      @campaigns = Campaign.find(:all, :limit => 25)
    elsif params[:search] && params[:near] && params[:distance]
      @campaigns = Campaign.location_search(params[:search], params[:near], params[:distance]) | Campaign.find_tagged_with(params[:search], :origin => params[:near], :within => params[:distance]) | Campaign.no_address_search(params[:search])
    elsif params[:search] && params[:near] == ""
      @campaigns = Campaign.search(params[:search]) | Campaign.find_tagged_with(params[:search])  | Campaign.no_address_search(params[:search])
    elsif params[:search] && params[:near]
      @campaigns = Campaign.location_search(params[:search], params[:near], 25) | Campaign.find_tagged_with(params[:search], :origin => params[:near], :within => 25)  | Campaign.no_address_search(params[:search])
    elsif params[:search] || params[:near] == ""
      @campaigns = Campaign.search(params[:search]) | Campaign.find_tagged_with(params[:search])  | Campaign.no_address_search(params[:search])
    else
      @campaigns = Campaign.find(:all, :limit => 25)
    end
    
    if params[:near]
    	@zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{params[:near]}"
    elsif current_user
      unless current_user.profile.nil?
    	  @zip = Geokit::Geocoders::GoogleGeocoder.geocode "#{current_user.profile.zip}"
    	end
    else
      @zip = nil
    end
    
    @tags = Campaign.tag_counts
  end
  

  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Successfully deleted campaign."
    redirect_to root_url
  end
  
  def vote_up
    @campaign = Campaign.find(params[:campaign])
    @user = @campaign.user
    current_user.vote_for(@campaign)
    current_user.points = current_user.points + 1
    current_user.save
    @user.points = @user.points + 1
    @user.save
    render :update do |page| 
     page.replace_html "voting", ""
     page.replace_html "votes_for", "#{image_tag "votes_up.gif"}#{@campaign.votes_for}"
     page.replace_html "score_percentage", "#{score_percentage(@campaign)}%"
    end
  end
  
  def vote_down
    @campaign = Campaign.find(params[:campaign])
    current_user.vote_against(@campaign)
    current_user.points = current_user.points + 1
    current_user.save
    render :update do |page| 
     page.replace_html "voting", ""
     page.replace_html "votes_against", "#{image_tag "votes_down.gif", :style => "margin-top:3px;position:relative;top:6px;"}#{@campaign.votes_against}"
     page.replace_html "score_percentage", "#{score_percentage(@campaign)}%"
    end
  end
  
      
end
