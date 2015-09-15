class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new
    if @job.save
      redirect_to root_path
    else
      render 'new'
  end

  def destroy
  end
end
