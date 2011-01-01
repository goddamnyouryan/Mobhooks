class UsersController < ApplicationController
  def index
    @users = User.all
    @leaderboard = User.find :all, :order => "points DESC", :limit => 25
    @recent = Campaign.find :all, :order => "created_at DESC", :limit => 25
  end
  
  def admin 
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @comment = Comment.new(params[:comment])
    @commented = Comment.find(:all, :conditions => ["commenter_id in (?)", @user.id])
    @downvotes = @user.votes.find(:all, :conditions => ["vote = ?", false])
    @downvoted = @downvotes.size
    @reviews = Review.find(:all, :conditions => ["reviewer_id in (?)", @user.id])
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      @profile = Profile.create
      @profile.user_id = @user.id
      @profile.save
      @user.points = @user.points + 100
      @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user account."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully deleted user."
    redirect_to root_url
  end
  
end
