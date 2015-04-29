class JobsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_user, only: [:index, :new, :create]


  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def profile
  end

  def new
    @job = @user.jobs.build
  end

  def create
    @job = @user.jobs.build(job_params)
    @job.user_id = current_user.id
  
    if @job.save
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js 
      end
      # redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    if current_user.id == @job.user_id
    respond_to do |format|
      format.html 
      format.js
    end
  end
  end

  def update
    @job = Job.find(params[:id])
    @user = @job.user
    if current_user.id == @job.user_id
      if @job.update(job_params)
        respond_to do |format|
          format.html { redirect_to profile_path }
          format.js 
        end
      else
        render :edit
      end
    end
  end

  def destroy
     @job = Job.find(params[:id])
    if current_user.id == @job.user_id
    @job.destroy
    redirect_to profile_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:company, :start_date, :end_date, :position, :description, :user_id, :current_employer)
  end

  def set_user
      @user = User.find(params[:user_id])
    end

end
