class RegistrationsController < Devise::RegistrationsController


  def after_sign_up_path_for(resource)
    flash[:notice] = "You have successfully signed up! Please fill-in your profile information."
    edit_user_registration_path
  end

  def after_update_path_for(resource)
    flash[:notice] = "You're almost done. Add work experience, education and certifications."
    user_path(@user)
  end

  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :image)
    end
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password,
                                   :address, :city, :state, :zip, :twitter, :birthdate, :phone, :mobile_phone, :gender,
                                   :secondary_email, :bio, :image)
    end

end