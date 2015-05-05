class RegistrationsController < Devise::RegistrationsController


  def after_sign_up_path_for(resource)
    flash[:notice] = "You have successfully signed up! Please fill-in your profile information."
    edit_user_registration_path
  end

  def after_update_path_for(resource)
    flash[:notice] = "You're almost done. Add work experience, education and certifications."
    user_path(@user)
  end

  # def update
  #   @user = User.find(current_user.id)
  #   email_changed = @user.email != params[:user][:email]
  #   is_facebook_account = !@user.provider.blank?

  #   successfully_updated = if !is_facebook_account
  #     @user.update_with_password(params[:user])
  #   else
  #     @user.update_without_password(params[:user])
  #   end

  #   if successfully_updated
  #     # Sign in the user bypassing validation in case his password changed
  #     sign_in @user, :bypass => true
  #     redirect_to feed_path
  #   else
  #     render "edit"
  #   end
  # end

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