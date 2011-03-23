class LocationsController < ApplicationController
  before_filter :require_user
  
  def index
    @business = Business.find(params[:business_id])
    @location = Location.new
  end
  
  def show
    @location = Location.find(params[:id])
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    @business = Business.find(params[:business_id])
    @location.business_id = @business.id
    if @location.save
      @geocode = Geokit::Geocoders::GoogleGeocoder.geocode "#{@location.address} #{@location.city} #{@location.city} #{@location.zip}"
      @location.lat = @geocode.lat
      @location.lng = @geocode.lng
      @location.save!
      current_user.points = current_user.points + 5
      current_user.save!
      flash[:notice] = "Successfully added location for #{@business.name}"
      redirect_to @business
    else
      render :action => 'new'
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[:notice] = "Successfully updated location."
      redirect_to @location
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = "Successfully destroyed location."
    redirect_to locations_url
  end
end
