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
    @profile = Profile.find(params(:id))
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to profile_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to profile_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to profile_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:job_company, :job_start_date, :job_end_date, :job_position, :job_description)
  end

end
