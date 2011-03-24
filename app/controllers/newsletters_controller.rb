class NewslettersController < ApplicationController
  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      flash[:notice] = "Successfully signed up for newsletter."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
