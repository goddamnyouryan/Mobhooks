class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = current_user.campaigns.new(params[:campaign])
    @business = Business.find_by_name(params[:campaign][:business_id])
    @business_name = params[:campaign][:business_id]
    unless @business.nil?
      @campaign.business_id = @business.id
      @campaign.save!      
      redirect_to @campaign
    else
      @campaign.save!
      flash[:notice] = "Successfully created campaign."
      flash[:business_name] = @business_name
      session[:created_campaign] = @campaign.id
      redirect_to new_business_path
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      flash[:notice] = "Successfully updated campaign."
      redirect_to @campaign
    else
      render :action => 'edit'
    end
  end
  
  def show
    @campaign = Campaign.find(params[:id])
    @business = Business.find(@campaign.business_id)
  end
  
  def index
    @campaigns = Campaign.all
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:notice] = "Successfully deleted campaign."
    redirect_to campaigns_url
  end
  
  def vote_up
    @campaign = Campaign.find(params[:campaign])
    current_user.vote_for(@campaign)
    render :update do |page| 
     page.replace_html "voting", "You voted this campaign up."
     page.replace_html "votes_for", "#{@campaign.votes_for} upvotes"
    end
  end
  
  def vote_down
    @campaign = Campaign.find(params[:campaign])
    current_user.vote_against(@campaign)
    render :update do |page| 
     page.replace_html "voting", "You voted this campaign down."
     page.replace_html "votes_against", "#{@campaign.votes_against} downvotes"
    end
  end
  
  
  
end
