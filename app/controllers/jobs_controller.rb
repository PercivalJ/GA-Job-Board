class JobsController < ApplicationController
  def index
    @jobs = Job.page(params[:page]).per(5)
  end


  def show
  @job = Job.find(params[:id]) 
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
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
      params.require(:job).permit(:title, :company, :location, :url, :description)
    end


end
