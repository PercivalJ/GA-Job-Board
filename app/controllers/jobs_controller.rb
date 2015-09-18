class JobsController < ApplicationController
  include JobsHelper
  def index
    @jobs = Job.page(params[:page]).per(5).order(created_at: :desc)
  end


  def show
  @job = Job.find(params[:id])
  # @opener = opener    attempt to have links open with target blank
  end

  def new
  @job = Job.new
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
  end
end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = current_user.jobs.find(params[:id])

    if @job.update_attributes(job_params)
        redirect_to jobs_path
    else
      render :edit
    end
  end

  
  def destroy
    @job = Job.find(params[:id])
    @job.comments.destroy_all 
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
      params.require(:job).permit(:title, :company, :location, :url, :description)
    end


end
