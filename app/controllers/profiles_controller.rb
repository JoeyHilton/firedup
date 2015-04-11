class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profile = Profile.all
    @educations = Education.all
    @jobs = Job.all
    @users = User.all
  end

  def show
    @profile = Profile.find(params[:id])

    @jobs = @profile.jobs
    @educations = @profile.educations
    @certs = @profile.certs
    @user = User.find(params[:id])

  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile successfully updated!"
    else
      render :edit
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end


  def destroy
    @profile = Profile.find(params[:id])
    @Profiles.destroy
    redirect_to profiles_url, alert: "Profile successfully deleted!"
    @education.destroy
    redirect_to profile_educations_path
  end



  private

  def profile_params
    params.require(:profile).permit(:up_fname, :up_lname, :up_address, :up_city, :up_state, :up_zip,
                                    :up_twitter, :up_birthdate, :up_phone, :up_mobilephone, :up_gender,
                                    :up_secondemail, :up_bio, :user_id)
  end

  def set_education
      @education = Education.find(params[:id])
  end

end

