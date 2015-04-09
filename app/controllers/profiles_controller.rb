class ProfilesController < ApplicationController

  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :back
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
  end



  private

  def profile_params
    params.require(:profile).permit(:up_fname, :up_lname, :up_address, :up_city, :up_state, :up_zip,
                                    :up_twitter, :up_birthdate, :up_phone, :up_mobilephone, :up_gender,
                                    :up_secondemail, :up_bio)
  end

end

