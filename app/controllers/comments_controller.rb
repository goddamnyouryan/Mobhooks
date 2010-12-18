class CommentsController < ApplicationController
  def index
    @comment = Comment.new(params[:comment])
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @user = User.find(params[:user_id])
    @comment.user_id = @user.id
    @comment.commenter_id = current_user.id
    @comment.save
    if @comment.save
      flash[:notice] = "Successfully commented on #{@user.login}"
      redirect_to user_url(@user)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "comment deleted"
    redirect_to comments_url
  end
end
