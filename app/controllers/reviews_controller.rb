class ReviewsController < ApplicationController
  def index
    @review = Review.new(params[:review])
    @campaign = Campaign.find(params[:campaign_id])
    @reviews = @campaign.reviews
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(params[:review])
    @campaign = Campaign.find(params[:campaign_id])
    @review.campaign_id = @campaign.id
    @review.reviewer_id = current_user.id
    @review.save
    if @review.save
      flash[:notice] = "Successfully reviewed campaign."
      redirect_to campaign_url(@campaign)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:notice] = "Successfully updated review."
      redirect_to @review
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Successfully destroyed review."
    redirect_to reviews_url
  end
end
