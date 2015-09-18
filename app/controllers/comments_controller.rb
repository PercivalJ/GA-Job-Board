class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def show
  @comment = Comment.find(params[:id]) 
  end

  def new
  @comment = Comment.new
  @job = Job.find(params[:job_id])
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
  	@job = Job.find(params[:id])
    @comment = Comment.find(params[:id)
  end
 

  def update
  	@job = Job.find(params[:id])
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
    redirect_to job_path
  end

  private
  def comment_params
      params.require(:comment).permit(:body)
    end


end
