class RegistrationsController < Devise::RegistrationsController


  def after_sign_in_path_for(resource)
    profile_path
  end

  def after_update_path_for(resource)
    profile_path
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