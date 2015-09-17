class CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page]).per(3)
  end


  def show
  @comment = Comment.find(params[:id]) 
  end

  def new
  @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to job_comments_path
    else
      render :new
  end
end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update_attributes(comment_params)
        redirect_to comments_path
    else
      render :edit
    end
  end

  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private
  def comment_params
      params.require(:comment).permit(:body, :user_id)
    end


end
