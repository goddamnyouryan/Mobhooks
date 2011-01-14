class ProfilesController < ApplicationController
  def new
    @profile = current_user.profile.new
  end
  
  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      flash[:notice] = "Successfully created profile."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Successfully updated profile."
      redirect_to user_url(current_user)
    else
      render :action => 'edit'
    end
  end
end
