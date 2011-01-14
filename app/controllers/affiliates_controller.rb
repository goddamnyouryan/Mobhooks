class AffiliatesController < ApplicationController
  def index
    @affiliates = Affiliate.all
  end

  def new
    @affiliate = Affiliate.new
  end

  def create
    @affiliate = Affiliate.new(params[:affiliate])
    if current_user
    	@affiliate.user_id = current_user.id
    end
    if @affiliate.save
      flash[:notice] = "Successfully submitted affiliate info. A Mobhooks Rep will contact you shortly."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
