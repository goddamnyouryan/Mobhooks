class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      @achievements = Achievement.find(:all, :conditions => ["user_id = ? AND  state = ?", current_user.id, "unread"])
      if @achievements.empty?
        if session[:return_to]
          flash[:notice] = "Successfully logged in. Welcome #{current_user.login}!"
          redirect_to session[:return_to]
        else
          flash[:notice] = "Successfully logged in. Welcome #{current_user.login}!"
          redirect_to root_url
        end
      else
        flash[:notice] = "Successfully logged in. Welcome #{current_user.login}! You've been awarded a new badge!"
        redirect_to @achievements[0]
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
