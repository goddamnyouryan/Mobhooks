class BusinessesController < ApplicationController
	
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
    @business = Business.new(params[:business])
    @business.tag_list = params[:business][:tag_list]
    @business.save!
    if @business.save
      if session[:created_campaign]
        @campaign = session[:created_campaign]
        @campaign.business_id = @business.id
        @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{@business.address} #{@business.city} #{@business.city} #{@business.zip}"
        @campaign.lat = @geocode.lat
        @campaign.lng = @geocode.lng
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
        @campaign.save!
        session[:created_campaign] = nil
        session[:business_name] = nil
      end
      flash[:notice] = "Successfully created business."
      redirect_to @business
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
      flash[:notice] = "Successfully updated business."
      redirect_to @business
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
  
end
