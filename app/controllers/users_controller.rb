class UsersController < ApplicationController
  def index
    @users = User.all
    @leaderboard = User.find :all, :order => "points DESC", :limit => 25
    @recent = Campaign.find :all, :order => "created_at DESC", :limit => 25
  end
  
  def admin 
     if current_user.role == "admin"
      @users = User.all
    else
      redirect_to root_url
    end
  end
  
  def show
    @user = User.find(params[:id])
    @comment = Comment.new(params[:comment])
    @commented = Comment.find(:all, :conditions => ["commenter_id in (?)", @user.id])
    @downvotes = @user.votes.find(:all, :conditions => ["vote = ?", false])
    @downvoted = @downvotes.size
    @reviews = Review.find(:all, :conditions => ["reviewer_id in (?)", @user.id])
    @ten_latest = Campaign.find :all, :conditions => ["user_id = ?", @user.id], :limit => 10
    @available = @user.points - @user.redeemed
  end
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => 'Whoops, you might be a robot. Try again.') && @user.save
      @profile = Profile.create
      @profile.user_id = @user.id
      @profile.save
      @user.points = @user.points + 100
      if params[:newsletter] == 0
        @user.newsletter = false
      end
      @user.save
      if @user.newsletter == true
        @user.points = @user.points + 100
        @user.save!
        flash[:notice] = "Registration Successful! Welcome #{current_user.login}! Thanks for subscribing to our newsletter. You may unsubscribe at any time from within our emails."
        redirect_to root_url
      else
        flash[:notice] = "Registration Successful! Welcome #{current_user.login}!"
        redirect_to root_url
      end
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
  
  def redeem_points
    @available = current_user.points - current_user.redeemed
    unless @available > 999
      flash[:notice] = "Sorry you don't have enough points to redeem."
      redirect_to root_path
    end
  end
  
  def redeeming
    @points = Integer(params[:points])
    @available = current_user.points - current_user.redeemed
    if @points > @available
      flash[:notice] = "You don't have this many points available for redemption!"
      redirect_to redeem_points_path
    elsif @points <= 1000
      flash[:notice] = "You must redeem at least 1000 points."
      redirect_to redeem_points_path
    else
      current_user.redeemed = current_user.redeemed + @points
      current_user.save
      mail = Notifier.create_redeem_points(current_user, @points, params[:email])
      Notifier.deliver(mail)
      flash[:notice] = "You have submitted your redemption request. A MobHooks associate will contact you shortly."
      redirect_to root_path
    end
  end
  
end
