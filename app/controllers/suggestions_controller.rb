class SuggestionsController < ApplicationController
  def new
    @suggestions = Suggestions.new
  end
  
  def create
    @suggestions = Suggestions.new(params[:suggestions])
    if current_user
    	@suggestions.user_id = current_user.id
    end
    if @suggestions.save
      flash[:notice] = "Successfully submitted suggestions. Thanks for your input!"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
