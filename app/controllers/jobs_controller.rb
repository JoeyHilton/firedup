class JobsController < ApplicationController
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def profile
  end

  def new
    @job = Job.new
    @user = current_user
    # @user = User.find_by(user_id: current_user)
  end

  def create
    @job = Job.new(job_params)
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
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.js
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      respond_to do |format|
        format.html { redirect_to profile_path }
        format.js 
      end
      # redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to profile_path
  end

  private

  def job_params
    params.require(:job).permit(:company, :start_date, :end_date, :position, :description, :user_id)
  end

end
